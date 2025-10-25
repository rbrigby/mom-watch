# frozen_string_literal: true

class YoutubeVideo < ApplicationRecord
  belongs_to :youtube_channel

  enum caption_format: {
    srt: "srt",
    vtt: "vtt",
    xml: "xml"
  }
end



