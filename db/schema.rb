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

ActiveRecord::Schema.define(version: 20150401092417) do

  create_table "carpools", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "type",          limit: 255
    t.date     "journey_date"
    t.time     "depature_time"
    t.integer  "price",         limit: 4
    t.integer  "luggage_size",  limit: 4
    t.text     "other",         limit: 65535
    t.integer  "car_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "brand",      limit: 255
    t.string   "model",      limit: 255
    t.string   "color",      limit: 255
    t.integer  "seats",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "carpool_id",  limit: 4
    t.string   "destination", limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.integer  "passenger",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.string   "music",      limit: 255
    t.string   "pets",       limit: 255
    t.string   "smoking",    limit: 255
    t.boolean  "ladies",     limit: 1
    t.string   "food",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.integer  "seats",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.string   "source",     limit: 255
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
