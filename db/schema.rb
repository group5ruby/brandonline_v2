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

ActiveRecord::Schema.define(version: 20170401133014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "account_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "bank_name"
    t.index ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree
  end

  create_table "careers", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_careers_on_user_id", using: :btree
  end

  create_table "date_of_births", force: :cascade do |t|
    t.datetime "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_date_of_births_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "accepted_at"
  end

  create_table "hometowns", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hometowns_on_user_id", using: :btree
  end

  create_table "identity_numbers", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identity_numbers_on_user_id", using: :btree
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree
  end

  create_table "sexes", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sexes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
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
    t.string   "user_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "filepicker_url"
    t.string   "facebook_link"
    t.boolean  "identity_number",        default: false
    t.boolean  "phone_number",           default: false
    t.boolean  "date_of_birth",          default: false
    t.boolean  "work_place",             default: false
    t.boolean  "career",                 default: false
    t.string   "business"
    t.boolean  "sex",                    default: false
    t.boolean  "address",                default: false
    t.boolean  "hometown",               default: false
    t.integer  "positive_count"
    t.integer  "negative_count"
    t.string   "zalo"
    t.boolean  "is_verified",            default: false
    t.integer  "account_status",         default: 1
    t.datetime "seen"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "work_places", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_places_on_user_id", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "careers", "users"
  add_foreign_key "date_of_births", "users"
  add_foreign_key "hometowns", "users"
  add_foreign_key "identity_numbers", "users"
  add_foreign_key "phone_numbers", "users"
  add_foreign_key "sexes", "users"
  add_foreign_key "work_places", "users"
end
