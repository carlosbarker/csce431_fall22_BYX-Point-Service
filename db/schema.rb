# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_18_222700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Attendance", force: :cascade do |t|
    t.datetime "arrival_time"
  end

  create_table "Event", force: :cascade do |t|
    t.datetime "datetime"
    t.string "title"
    t.string "description"
  end

  create_table "Member", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "f_name"
    t.string "l_name"
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "arrival_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "datetime"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "user"
    t.string "password"
    t.string "f_name"
    t.string "l_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
