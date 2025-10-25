# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_25_120200) do
  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "youtube_videos", force: :cascade do |t|
    t.integer "youtube_channel_id", null: false
    t.string "video_id", null: false
    t.string "title"
    t.datetime "published_at"
    t.text "caption_body"
    t.string "caption_format"
    t.string "caption_language"
    t.string "caption_source"
    t.integer "caption_bytes"
    t.binary "caption_body_gzip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["video_id"], name: "index_youtube_videos_on_video_id", unique: true
    t.index ["youtube_channel_id"], name: "index_youtube_videos_on_youtube_channel_id"
  end

  add_foreign_key "youtube_videos", "youtube_channels"
end
