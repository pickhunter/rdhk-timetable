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

ActiveRecord::Schema.define(version: 20151217070116) do

  create_table "batch_subject", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "subject_id"
    t.integer "teacher_id"
  end

  create_table "batch_subject", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "subject_id"
    t.integer "teacher_id"
  end

  create_table "batch_subjects", force: :cascade do |t|
    t.integer  "batch_id"
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "slot_id"
  end

  add_index "bookings", ["slot_id"], name: "index_bookings_on_slot_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "time_table_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "slots", force: :cascade do |t|
    t.integer  "timeslot_id"
    t.integer  "batch_id"
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "code"
    t.string   "sub_type"
    t.string   "name"
    t.integer  "semester"
    t.integer  "department_id"
  end

  add_index "subjects", ["department_id"], name: "index_subjects_on_department_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "time_tables", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer  "day"
    t.time     "starttime"
    t.time     "endtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
