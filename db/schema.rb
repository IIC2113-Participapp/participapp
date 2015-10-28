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

ActiveRecord::Schema.define(version: 20151025162726) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_users", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_users", ["category_id"], name: "index_category_users_on_category_id"
  add_index "category_users", ["user_id"], name: "index_category_users_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "published_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "forum_id"
  end

  add_index "comments", ["forum_id"], name: "index_comments_on_forum_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "authorization_status"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "category_id"
  end

  add_index "contents", ["category_id"], name: "index_contents_on_category_id"
  add_index "contents", ["user_id"], name: "index_contents_on_user_id"

  create_table "forums", force: :cascade do |t|
    t.text     "description"
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

  add_index "forums", ["content_id"], name: "index_forums_on_content_id"
  add_index "forums", ["user_id"], name: "index_forums_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "editor",              default: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",               default: false
    t.integer  "periodicity"
    t.datetime "last_received"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
