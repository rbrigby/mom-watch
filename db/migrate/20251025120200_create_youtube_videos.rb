# frozen_string_literal: true

class CreateYoutubeVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :youtube_videos do |t|
      t.references :youtube_channel, null: false, foreign_key: true
      t.string :video_id, null: false
      t.string :title
      t.datetime :published_at

      # Caption storage (uncompressed text)
      t.text :caption_body
      t.string :caption_format
      t.string :caption_language
      t.string :caption_source # "official" or "unofficial"
      t.integer :caption_bytes

      # Optional: compressed storage (if large)
      t.binary :caption_body_gzip

      t.timestamps
    end

    add_index :youtube_videos, :video_id, unique: true
  end
end



