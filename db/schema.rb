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

ActiveRecord::Schema[8.0].define(version: 2025_03_19_091709) do
  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.string "location"
    t.integer "duration"
    t.datetime "start_date_1", precision: nil
    t.datetime "start_date_2", precision: nil
    t.datetime "start_date_3", precision: nil
    t.integer "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_experiences_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_providers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "experience_id", null: false
    t.integer "status"
    t.datetime "reservation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_reservations_on_experience_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "experience_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_reviews_on_experience_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experiences", "providers"
  add_foreign_key "reservations", "experiences"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "experiences"
  add_foreign_key "reviews", "users"
end
