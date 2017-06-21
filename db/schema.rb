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

ActiveRecord::Schema.define(version: 20170620160734) do

  create_table "businesses", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "address"
    t.boolean  "account_active",    default: false
    t.string   "business_address"
    t.string   "category_code"
    t.string   "category_name"
    t.integer  "class_code"
    t.string   "class_name"
    t.string   "email"
    t.string   "mailing_addres"
    t.string   "name"
    t.string   "physical_location"
    t.string   "phone"
    t.date     "start_date"
    t.boolean  "taxes_current",     default: false
    t.integer  "units"
    t.string   "county"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

end
