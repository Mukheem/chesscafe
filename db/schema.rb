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

ActiveRecord::Schema.define(version: 20180127143007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.text "name"
    t.string "phonenumber"
    t.string "email"
    t.string "address"
    t.text "gender"
    t.text "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "item_id"
    t.float "unit_price"
    t.integer "tax"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text "ordertype"
    t.jsonb "order_placed"
    t.float "totalprice"
    t.text "paymentmethod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "table_no"
    t.integer "discount_on_bill"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_code"
    t.string "product_name"
    t.string "category"
    t.text "description"
    t.string "tax_name"
    t.string "tax_type"
    t.integer "tax"
    t.integer "cess"
    t.integer "quantity"
    t.integer "purchase_price"
    t.integer "sale_price"
    t.integer "products_remaining"
    t.integer "products_sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "item_name"
    t.string "item_id"
    t.float "unit_price"
    t.float "tax"
    t.float "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
