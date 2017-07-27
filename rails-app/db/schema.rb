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

ActiveRecord::Schema.define(version: 20170725161253) do

  create_table "attendances", force: :cascade do |t|
    t.datetime "received"
    t.string "cartao"
    t.integer "roll_call_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roll_call_id"], name: "index_attendances_on_roll_call_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "roll_calls", force: :cascade do |t|
    t.date "call_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "secret"
    t.integer "course_id"
    t.index ["course_id"], name: "index_roll_calls_on_course_id"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "username"
    t.string "cartao"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
