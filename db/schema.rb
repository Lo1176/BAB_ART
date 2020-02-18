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

ActiveRecord::Schema.define(version: 2020_02_17_160146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "number_of_days"
    t.integer "total_price"
    t.date "start_date"
    t.date "end_date"
    t.text "review"
    t.integer "rating"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "piece_of_art_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["piece_of_art_id"], name: "index_bookings_on_piece_of_art_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "piece_of_arts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "daily_price"
    t.string "description"
    t.float "average_rating"
    t.integer "buying_price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "available"
    t.boolean "available_for_sale"
    t.string "artist_name"
    t.integer "creation_date"
    t.index ["user_id"], name: "index_piece_of_arts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "piece_of_arts"
  add_foreign_key "bookings", "users"
  add_foreign_key "piece_of_arts", "users"
end