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

ActiveRecord::Schema.define(version: 20170130193716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_types", force: :cascade do |t|
    t.string   "DType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",         precision: 12, scale: 3
    t.boolean  "active",                                 default: true
    t.integer  "restaurant_id"
    t.integer  "dish_type_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.integer  "menu_id"
    t.integer  "order_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "OStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "delivery_charge", precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "payment_type_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "PType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_types", force: :cascade do |t|
    t.string   "RType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.boolean  "active"
    t.decimal  "minimum_order",         precision: 12, scale: 3
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "commission_percentage", precision: 12, scale: 3
    t.integer  "restaurant_type_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

end
