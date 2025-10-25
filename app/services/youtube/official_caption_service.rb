# frozen_string_literal: true

require "google/apis/youtube_v3"
require "stringio"

module Youtube
  class OfficialCaptionService
    def initialize(api_key: ENV["YOUTUBE_API_KEY"]) # Use OAuth if needed later
      @api_key = api_key
      @service = Google::Apis::YoutubeV3::YouTubeService.new
      @service.key = @api_key if @api_key
    end

    # Returns Google::Apis::YoutubeV3::ListCaptionsResponse
    def list_captions(video_id)
      @service.list_captions("snippet", video_id)
    end

    # Download a caption by ID in a specific text format ("srt" or "vtt")
    def download_caption_by_id(caption_id, tfmt: "srt")
      buffer = StringIO.new
      @service.download_caption(caption_id, buffer, tfmt: tfmt)
      buffer.string
    end

    # Fetch captions for a video, optionally preferring a language and trying formats in order
    # Returns { body:, format:, language:, caption_id: }
    def fetch_captions(video_id, preferred_language: nil, formats: %w[srt vtt])
      captions = list_captions(video_id)&.items || []
      return nil if captions.empty?

      track = pick_track(captions, preferred_language)
      return nil unless track

      language = track&.snippet&.language
      caption_id = track.id

      formats.each do |fmt|
        begin
          body = download_caption_by_id(caption_id, tfmt: fmt)
          return { body: body, format: fmt, language: language, caption_id: caption_id }
        rescue StandardError
          next
        end
      end

      nil
    end

    private

    def pick_track(captions, preferred_language)
      return captions.first if preferred_language.nil?
      captions.find { |c| c&.snippet&.language&.to_s&.downcase == preferred_language.to_s.downcase } || captions.first
    end
  end
end



