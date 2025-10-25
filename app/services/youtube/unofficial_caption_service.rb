# frozen_string_literal: true

require "open3"
require "tmpdir"

module Youtube
  class UnofficialCaptionService
    def initialize(yt_dlp_path: "yt-dlp")
      @yt_dlp_path = yt_dlp_path
    end

    # Returns { body:, format:, language: }
    def fetch_captions(video_id, preferred_language: "en", formats: %w[srt vtt])
      url = "https://www.youtube.com/watch?v=#{video_id}"

      Dir.mktmpdir("yt_subs_") do |dir|
        # Attempt auto and manual subs, prefer preferred_language if available
        sub_langs = preferred_language ? preferred_language.to_s : "all"

        cmd = [
          @yt_dlp_path,
          "-q",
          "--no-warnings",
          "--skip-download",
          "--write-sub",
          "--write-auto-sub",
          "--sub-langs", sub_langs,
          "--sub-format", formats.join(","),
          "--no-playlist",
          "-o", File.join(dir, "%(id)s.%(ext)s"),
          url
        ]

        _stdout, stderr, status = Open3.capture3(*cmd)
        raise "yt-dlp failed: #{stderr}" unless status.success?

        # Find a generated subtitle file, prefer requested formats order
        formats.each do |fmt|
          paths = Dir.glob(File.join(dir, "#{video_id}*.#{fmt}"))
          next if paths.empty?

          path = pick_language(paths, preferred_language)
          body = File.read(path)
          language = extract_language_from_filename(path, video_id, fmt)
          return { body: body, format: fmt, language: language }
        end

        nil
      end
    end

    private

    def pick_language(paths, preferred_language)
      return paths.first unless preferred_language
      exact = paths.find { |p| p =~ /\.#{Regexp.escape(preferred_language)}\./i }
      exact || paths.first
    end

    def extract_language_from_filename(path, video_id, fmt)
      # Examples: abc123.en.srt, abc123.en-US.vtt
      base = File.basename(path)
      m = base.match(/^#{Regexp.escape(video_id)}\.(?<lang>[^.]+)\.(?:#{fmt})$/)
      m ? m[:lang] : nil
    end
  end
end



