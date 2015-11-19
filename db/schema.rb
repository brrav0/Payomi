# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151118232148) do
=======
ActiveRecord::Schema.define(version: 20151118203617) do
>>>>>>> f1dcb3244fa61e9ddd287fdaf5e00eeb8d419f3a

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountingfirms", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

<<<<<<< HEAD
=======
  create_table "attached_files", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.boolean  "signed_bank"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "bankaccount_id"
    t.boolean  "is_audit"
    t.boolean  "is_bank"
  end

  add_index "attached_files", ["bankaccount_id"], name: "index_attached_files_on_bankaccount_id", using: :btree

>>>>>>> f1dcb3244fa61e9ddd287fdaf5e00eeb8d419f3a
  create_table "bankaccounts", force: :cascade do |t|
    t.string   "number"
    t.string   "currency"
    t.decimal  "balance"
    t.integer  "client_id"
    t.integer  "bank_id"
    t.datetime "shared"
    t.datetime "signed"
    t.datetime "issued"
    t.datetime "answered"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "answer"
  end

  create_table "bankcontacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
  end

  create_table "clientcontacts", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "number_and_street"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
  end

<<<<<<< HEAD
  create_table "confirmations", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "status"
    t.string   "reference"
  end

  add_index "confirmations", ["bank_id"], name: "index_confirmations_on_bank_id", using: :btree
  add_index "confirmations", ["client_id"], name: "index_confirmations_on_client_id", using: :btree
  add_index "confirmations", ["user_id"], name: "index_confirmations_on_user_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.text     "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=======
  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
>>>>>>> f1dcb3244fa61e9ddd287fdaf5e00eeb8d419f3a

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "clientcontact"
    t.boolean  "bankcontact"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "role"
  end

<<<<<<< HEAD
  add_foreign_key "confirmations", "banks"
  add_foreign_key "confirmations", "clients"
  add_foreign_key "confirmations", "users"
=======
  add_foreign_key "attached_files", "bankaccounts"
>>>>>>> f1dcb3244fa61e9ddd287fdaf5e00eeb8d419f3a
end
