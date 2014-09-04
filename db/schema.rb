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

ActiveRecord::Schema.define(version: 20140904031614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "tweets",          default: 0
  end

  create_table "campaign_users", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaign_users", ["campaign_id"], name: "index_campaign_users_on_campaign_id", using: :btree
  add_index "campaign_users", ["user_id"], name: "index_campaign_users_on_user_id", using: :btree

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "followers"
    t.string   "location"
    t.integer  "tweets"
  end

  add_index "campaigns", ["business_id"], name: "index_campaigns_on_business_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "location"
    t.string   "description"
    t.string   "image"
    t.string   "token"
    t.string   "token_secret"
    t.string   "followers"
    t.string   "screen_name"
    t.string   "friends"
    t.string   "background_image"
    t.string   "tweets"
    t.integer  "tweet_count"
  end

end
