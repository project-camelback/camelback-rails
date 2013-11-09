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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20131109223503) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20131108224413) do
>>>>>>> 5c2009fdca12ec7c8f79c9cb8896529a5cb07a1c

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.datetime "post_date"
    t.datetime "due_date"
    t.string   "evaluation_type"
    t.string   "branch"
  end

  create_table "email_processors", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mockups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

<<<<<<< HEAD
=======
  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

>>>>>>> 5c2009fdca12ec7c8f79c9cb8896529a5cb07a1c
end
