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

ActiveRecord::Schema.define(version: 20141022225644) do

  create_table "short_urls", force: true do |t|
    t.string   "long_url"
    t.string   "short_url"
    t.integer  "submitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "short_urls", ["short_url"], name: "index_short_urls_on_short_url", unique: true
  add_index "short_urls", ["submitter_id"], name: "index_short_urls_on_submitter_id"

  create_table "tags", force: true do |t|
    t.string "tag"
  end

  add_index "tags", ["tag"], name: "index_tags_on_tag", unique: true

  create_table "url_tags", force: true do |t|
    t.integer "url_id"
    t.integer "tag_id"
  end

  add_index "url_tags", ["tag_id"], name: "index_url_tags_on_tag_id"
  add_index "url_tags", ["url_id", "tag_id"], name: "index_url_tags_on_url_id_and_tag_id", unique: true
  add_index "url_tags", ["url_id"], name: "index_url_tags_on_url_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: true do |t|
    t.integer  "visitor_id"
    t.integer  "url_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["url_id"], name: "index_visits_on_url_id"
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id"

end
