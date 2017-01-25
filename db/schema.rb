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

ActiveRecord::Schema.define(version: 20170124204915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "billing_items", force: :cascade do |t|
    t.integer  "service_id"
    t.string   "description"
    t.integer  "hours"
    t.float    "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["service_id"], name: "index_billing_items_on_service_id", using: :btree
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "video"
    t.string   "title",              null: false
    t.text     "body",               null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "summary"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "small_summary"
    t.string   "video_image_url"
    t.string   "video_photo"
    t.index ["admin_id"], name: "index_blogs_on_admin_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_clients_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree
  end

  create_table "email_signups", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "hours"
    t.text     "description"
    t.float    "subtotal"
    t.float    "total"
    t.date     "due_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["service_id"], name: "index_invoices_on_service_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "user_email"
    t.string   "user_name"
    t.string   "name"
    t.text     "description"
    t.integer  "product_nubmber"
    t.float    "price"
    t.float    "total_hours"
    t.boolean  "subscription"
    t.boolean  "paid",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["client_id"], name: "index_products_on_client_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "title"
    t.text     "descriotion"
    t.float    "hourly_rate", default: 300.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["client_id"], name: "index_services_on_client_id", using: :btree
  end

  create_table "site_styles", force: :cascade do |t|
    t.integer  "style_type"
    t.string   "style_color"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "blog_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_tags_on_blog_id", using: :btree
  end

end
