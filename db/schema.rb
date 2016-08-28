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

ActiveRecord::Schema.define(version: 20160828144647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fs_key"
  end

  create_table "dateplans", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
    t.text    "places",  default: [], array: true
  end

  create_table "interests", force: :cascade do |t|
    t.string  "type"
    t.string  "description"
    t.string  "fs_key"
    t.integer "category_id"
  end

  create_table "interests_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "interest_id"
  end

  add_index "interests_users", ["interest_id"], name: "index_interests_users_on_interest_id", using: :btree
  add_index "interests_users", ["user_id"], name: "index_interests_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "gender"
    t.string   "email"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "password_hash"
  end

end
