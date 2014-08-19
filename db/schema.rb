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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 20140807071044) do
=======
<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 20140807033015) do
=======
ActiveRecord::Schema.define(version: 20140819080508) do
>>>>>>> Stashed changes
>>>>>>> Stashed changes

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "current_revisions", force: true do |t|
    t.string   "table_name"
    t.integer  "revision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_infos", force: true do |t|
    t.string   "title"
    t.integer  "placeid"
    t.integer  "categoryid"
    t.string   "firstday_time"
    t.string   "secondday_time"
    t.text     "description"
    t.string   "image_url"
    t.string   "movie_url"
    t.integer  "userid"
    t.boolean  "pending_approval"
    t.boolean  "reject_status"
    t.text     "reject_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subplace"
    t.boolean  "pending_rebuild",  default: true
    t.boolean  "pickup"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_event_infos", force: true do |t|
    t.integer  "event_id"
    t.string   "title"
    t.integer  "placeid"
    t.integer  "categoryid"
    t.string   "firstday_time"
    t.string   "secondday_time"
    t.text     "description"
    t.string   "image_url"
    t.string   "movie_url"
    t.string   "subplace"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
    t.boolean  "pickup"
  end

  create_table "subplaces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates_eventinfos", force: true do |t|
    t.integer  "revision"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_flag"
    t.boolean  "update_flag"
    t.boolean  "delete_flag"
  end

  create_table "users", force: true do |t|
    t.integer  "userid"
    t.string   "name"
    t.string   "email"
    t.string   "group"
    t.boolean  "staff",           default: false
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "managerId"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
