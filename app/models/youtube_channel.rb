# frozen_string_literal: true

class YoutubeChannel < ApplicationRecord
  has_many :youtube_videos, dependent: :destroy
end



