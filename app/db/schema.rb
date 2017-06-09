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

ActiveRecord::Schema.define(version: 20170609211635) do

  create_table "donators", force: :cascade do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "address"
    t.string   "bloodType"
    t.string   "rhFactor"
    t.integer  "age"
    t.date     "lastDonation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone"
    t.string   "city"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "number"
    t.string   "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sms_models", force: :cascade do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
