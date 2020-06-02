# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_124301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "day"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_availabilities_on_teacher_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "homeworks", force: :cascade do |t|
    t.text "description"
    t.bigint "timeslot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["timeslot_id"], name: "index_homeworks_on_timeslot_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.text "experience"
    t.integer "years_of_experience"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_instruments_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["teacher_id"], name: "index_reviews_on_teacher_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_date"
    t.boolean "booked", default: false
    t.bigint "availability_id", null: false
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_timeslots_on_availability_id"
    t.index ["student_id"], name: "index_timeslots_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_per_hours"
    t.boolean "teacher"
    t.text "description"
    t.string "address"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", force: :cascade do |t|
    t.integer "counter"
    t.integer "price_cents"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_vouchers_on_student_id"
    t.index ["teacher_id"], name: "index_vouchers_on_teacher_id"
  end

  add_foreign_key "availabilities", "users", column: "teacher_id"
  add_foreign_key "genres", "users"
  add_foreign_key "homeworks", "timeslots"
  add_foreign_key "instruments", "users"
  add_foreign_key "reviews", "users", column: "student_id"
  add_foreign_key "reviews", "users", column: "teacher_id"
  add_foreign_key "timeslots", "availabilities"
  add_foreign_key "timeslots", "users", column: "student_id"
  add_foreign_key "vouchers", "users", column: "student_id"
  add_foreign_key "vouchers", "users", column: "teacher_id"
end
