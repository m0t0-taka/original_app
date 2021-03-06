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

ActiveRecord::Schema.define(version: 2021_09_06_114617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_contacts", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "user_id"
    t.text "contact_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_contacts_on_customer_id"
    t.index ["user_id"], name: "index_customer_contacts_on_user_id"
  end

  create_table "customer_documents", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "public_level"
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "document"
    t.index ["customer_id"], name: "index_customer_documents_on_customer_id"
    t.index ["user_id"], name: "index_customer_documents_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "product_contacts", force: :cascade do |t|
    t.bigint "product_id"
    t.text "contact_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["product_id"], name: "index_product_contacts_on_product_id"
    t.index ["user_id"], name: "index_product_contacts_on_user_id"
  end

  create_table "product_documents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.string "name"
    t.text "content"
    t.integer "public_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "document"
    t.index ["product_id"], name: "index_product_documents_on_product_id"
    t.index ["user_id"], name: "index_product_documents_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "serial_number"
    t.date "line_on"
    t.date "completed_on"
    t.date "shipmented_on"
    t.date "deliveried_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_schedules_on_customer_id"
  end

  create_table "user_customers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_user_customers_on_customer_id"
    t.index ["user_id"], name: "index_user_customers_on_user_id"
  end

  create_table "user_products", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_user_products_on_product_id"
    t.index ["user_id"], name: "index_user_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "department", default: 0, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_contacts", "customers"
  add_foreign_key "customer_contacts", "users"
  add_foreign_key "customer_documents", "customers"
  add_foreign_key "customer_documents", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "product_contacts", "products"
  add_foreign_key "product_contacts", "users"
  add_foreign_key "product_documents", "products"
  add_foreign_key "product_documents", "users"
  add_foreign_key "products", "users"
  add_foreign_key "schedules", "customers"
  add_foreign_key "user_customers", "customers"
  add_foreign_key "user_customers", "users"
  add_foreign_key "user_products", "products"
  add_foreign_key "user_products", "users"
end
