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

ActiveRecord::Schema.define(version: 20150112184249) do

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "index"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "score",         default: 0
    t.integer  "topic_id"
  end

  add_index "submissions", ["postable_type", "postable_id"], name: "index_submissions_on_postable_type_and_postable_id"
  add_index "submissions", ["topic_id"], name: "index_submissions_on_topic_id"
  add_index "submissions", ["user_id", "created_at"], name: "index_submissions_on_user_id_and_created_at"
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "trending_reason"
    t.string   "picture"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "topics", ["user_id", "created_at"], name: "index_topics_on_user_id_and_created_at"
  add_index "topics", ["user_id"], name: "index_topics_on_user_id"

  create_table "trends", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "votes", force: :cascade do |t|
    t.boolean  "liked"
    t.integer  "user_id"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id"
  add_index "votes", ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"

end
