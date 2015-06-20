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

ActiveRecord::Schema.define(version: 20150619100636) do

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
  end

  create_table "clientcontacts", force: :cascade do |t|
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
  end

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
  end

end
