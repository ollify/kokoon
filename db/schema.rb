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

ActiveRecord::Schema.define(version: 2019_12_03_192649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ticket_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.bigint "user_id"
    t.string "photo"
    t.string "address"
    t.integer "capacity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "days_payment_due"
    t.string "checkout_session_id"
    t.bigint "rental_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.index ["rental_id"], name: "index_orders_on_rental_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "flat_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.string "tenant_email"
    t.boolean "pending", default: true
    t.integer "price_cents", default: 0, null: false
    t.index ["flat_id"], name: "index_rentals_on_flat_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["ticket_id"], name: "index_subscriptions_on_ticket_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "rental_id"
    t.string "category"
    t.string "title"
    t.string "room"
    t.text "content"
    t.integer "priority"
    t.string "photo"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_tickets_on_rental_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.text "description"
    t.date "birthdate"
    t.string "id_scan"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "flats", "users"
  add_foreign_key "orders", "rentals"
  add_foreign_key "orders", "users"
  add_foreign_key "rentals", "flats"
  add_foreign_key "subscriptions", "tickets"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tickets", "rentals"
end
