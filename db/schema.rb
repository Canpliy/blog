# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140621122419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.integer  "review_id"
    t.string   "review_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["review_id", "review_type"], name: "index_comments_on_review_id_and_review_type", using: :btree

  create_table "film_reviews", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "image_url"
    t.date     "release_time"
    t.decimal  "level",        precision: 2, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musics", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "singer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skins", force: true do |t|
    t.string   "name"
    t.string   "background_color"
    t.string   "background_image"
    t.string   "home_image"
    t.string   "article_image"
    t.string   "film_review_image"
    t.string   "music_image"
    t.string   "setting_image"
    t.string   "skin_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "label_id"
    t.string   "label_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["label_id", "label_type"], name: "index_tags_on_label_id_and_label_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "signature"
    t.string   "password_digest"
    t.string   "img_url"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
