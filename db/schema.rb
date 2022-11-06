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

ActiveRecord::Schema.define(version: 2022_10_04_133850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.boolean "tardy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "members_id"
    t.bigint "meetings_id"
    t.index ["meetings_id"], name: "index_attendances_on_meetings_id"
    t.index ["members_id"], name: "index_attendances_on_members_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "datetime"
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name"
    t.string "card_id"
    t.string "phone"
    t.boolean "graduated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "service_points", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "members_id"
    t.bigint "events_id"
    t.index ["events_id"], name: "index_service_points_on_events_id"
    t.index ["members_id"], name: "index_service_points_on_members_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "attendances", "meetings", column: "meetings_id"
  add_foreign_key "attendances", "members", column: "members_id"
  add_foreign_key "service_points", "events", column: "events_id"
  add_foreign_key "service_points", "members", column: "members_id"
  add_foreign_key "users", "members", column: "email", primary_key: "email"
end
