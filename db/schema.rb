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

ActiveRecord::Schema.define(version: 20131114052709) do

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "web_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.datetime "post_date"
    t.datetime "due_date"
    t.string   "evaluation_type"
    t.string   "branch"
    t.string   "github_created_at"
    t.string   "instructor_gravatar"
    t.string   "instructor_profile"
    t.string   "instructor"
    t.boolean  "spec_present",        default: false
  end

  create_table "email_processors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "to"
    t.string   "from"
    t.string   "subject"
    t.string   "body"
  end

  create_table "github_feeds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks", force: true do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.string   "name"
    t.string   "full_name"
    t.string   "web_url"
    t.string   "clone_url"
    t.string   "gravatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "evaluated"
    t.integer  "examples"
    t.integer  "passes"
    t.integer  "pendings"
    t.integer  "failures"
    t.string   "failure_descriptions"
    t.string   "evaluation_date"
    t.string   "current_issue"
  end

  create_table "mockups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.text     "content"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date"
    t.integer  "day_number"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "github_username"
    t.string   "semester"
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.string   "full_name"
    t.string   "web_url"
    t.string   "clone_url"
    t.string   "gravatar_url"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "login"
    t.string   "gravatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
