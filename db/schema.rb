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

ActiveRecord::Schema.define(version: 20170206062036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "department"
    t.integer  "course_number"
    t.string   "course_no"
    t.string   "full_title"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "tutoree"
    t.integer  "request"
    t.integer  "tutor"
    t.text     "comments"
    t.text     "tutor_comments"
    t.integer  "tutor_rating"
    t.integer  "tutoree_rating"
    t.integer  "rating"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "course"
    t.string   "topics"
    t.string   "description"
    t.datetime "creation"
    t.string   "user"
    t.string   "accepted_by"
    t.string   "location"
    t.integer  "rating"
    t.integer  "duration"
    t.boolean  "need_help"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "expiration"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "karma"
    t.string   "email"
    t.string   "major"
    t.integer  "year"
    t.string   "study_spot"
    t.string   "starred",          default: [],              array: true
  end

end
