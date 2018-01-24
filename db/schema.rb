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

ActiveRecord::Schema.define(version: 20180122153614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_rates", force: :cascade do |t|
    t.integer  "service_charge"
    t.integer  "discount_redeem"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "fullname"
    t.integer  "restaurant_id"
    t.string   "mobile_no"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "super_admin",            default: false
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dish_types", force: :cascade do |t|
    t.string   "DType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "driver_statuses", force: :cascade do |t|
    t.string   "DStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "driver_license"
    t.string   "aka"
    t.string   "driver_image"
    t.integer  "driver_status_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "menu_add_on_details", force: :cascade do |t|
    t.integer  "menu_add_on_id"
    t.string   "name"
    t.decimal  "price",          precision: 30, scale: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "menu_add_ons", force: :cascade do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.boolean  "multiple_selection", default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",            precision: 12, scale: 3
    t.boolean  "active",                                    default: true
    t.integer  "restaurant_id"
    t.integer  "dish_type_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "image"
    t.integer  "menu_category_id"
    t.decimal  "total_price",      precision: 12, scale: 3
    t.decimal  "commission",       precision: 12, scale: 3
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
    t.integer  "min_order"
    t.string   "delivery_notes"
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "PType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "restaurant_images", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.index ["restaurant_id"], name: "index_restaurant_images_on_restaurant_id", using: :btree
  end

  create_table "restaurant_timings", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.time     "monday"
    t.time     "tuesday"
    t.time     "wednesday"
    t.time     "thursday"
    t.time     "friday"
    t.time     "saturday"
    t.time     "sunday"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
    t.boolean  "active",                                         default: true
    t.decimal  "minimum_order",         precision: 12, scale: 3
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "commission_percentage", precision: 12, scale: 3
    t.integer  "restaurant_type_id"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "profile_image"
    t.string   "description"
    t.string   "slug"
  end

  create_table "restos", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "fullname"
    t.integer  "restaurant_id"
    t.integer  "resto_status_id",        default: 1
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "mobile_no"
    t.boolean  "active",                 default: true
    t.index ["email"], name: "index_restos_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_restos_on_reset_password_token", unique: true, using: :btree
  end

  create_table "suggest_restos", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "detailed_address"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "restaurant_type_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "tariff_rates", force: :cascade do |t|
    t.decimal  "min_km",         precision: 12, scale: 3
    t.decimal  "max_km",         precision: 12, scale: 3
    t.integer  "min_order"
    t.integer  "service_charge"
    t.string   "eta_delivery"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "full_address"
    t.integer  "address_type"
    t.string   "house_number"
    t.string   "street_name"
    t.string   "barangay_subdv"
    t.text     "additional_directions"
    t.string   "company_name"
    t.string   "building_number"
    t.string   "building_name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.boolean  "last_used",                                      default: false
    t.decimal  "distance_from_user",    precision: 12, scale: 3
    t.string   "mobile_number"
    t.string   "landline_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "fullname"
    t.string   "mobile_no"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "verified",               default: false
    t.string   "pin"
    t.string   "area_code"
    t.string   "authy_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "identities", "users"
end
