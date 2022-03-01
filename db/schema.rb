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

ActiveRecord::Schema.define(version: 2022_03_01_075954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "covers", force: :cascade do |t|
    t.bigint "waiter_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_covers_on_restaurant_id"
    t.index ["waiter_id"], name: "index_covers_on_waiter_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "description"
    t.string "category"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_foods_on_restaurant_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "food_id", null: false
    t.bigint "order_id", null: false
    t.string "status", default: "Submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_order_items_on_food_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.bigint "cover_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cover_id"], name: "index_orders_on_cover_id"
    t.index ["receipt_id"], name: "index_orders_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.boolean "is_paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.text "content"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_requests_on_order_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
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

  create_table "waiters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id", null: false
    t.index ["restaurant_id"], name: "index_waiters_on_restaurant_id"
  end

  add_foreign_key "covers", "restaurants"
  add_foreign_key "covers", "waiters"
  add_foreign_key "foods", "restaurants"
  add_foreign_key "order_items", "foods"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "covers"
  add_foreign_key "orders", "receipts"
  add_foreign_key "requests", "orders"
  add_foreign_key "restaurants", "users"
  add_foreign_key "waiters", "restaurants"
end
