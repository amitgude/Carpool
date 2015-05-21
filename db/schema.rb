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

ActiveRecord::Schema.define(version: 20150508092120) do

  create_table "carpools", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.date     "journey_date"
    t.time     "depature_time"
    t.integer  "price",         limit: 2
    t.integer  "luggage_size",  limit: 1
    t.text     "other",         limit: 65535
    t.integer  "car_id",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "brand",                limit: 20
    t.string   "model",                limit: 20
    t.string   "color",                limit: 20
    t.integer  "seats",                limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "carpool_id",  limit: 4
    t.string   "destination", limit: 50
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "topic",                      limit: 255
    t.text     "body",                       limit: 65535
    t.integer  "received_messageable_id",    limit: 4
    t.string   "received_messageable_type",  limit: 255
    t.integer  "sent_messageable_id",        limit: 4
    t.string   "sent_messageable_type",      limit: 255
    t.boolean  "opened",                     limit: 1,     default: false
    t.boolean  "recipient_delete",           limit: 1,     default: false
    t.boolean  "sender_delete",              limit: 1,     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry",                   limit: 255
    t.boolean  "recipient_permanent_delete", limit: 1,     default: false
    t.boolean  "sender_permanent_delete",    limit: 1,     default: false
  end

  add_index "messages", ["ancestry"], name: "index_messages_on_ancestry", using: :btree
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], name: "acts_as_messageable_ids", using: :btree

  create_table "passengers", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.integer  "passenger",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.string   "music",      limit: 10
    t.string   "pets",       limit: 10
    t.string   "smoking",    limit: 10
    t.boolean  "ladies",     limit: 1
    t.string   "food",       limit: 10
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.integer  "seats",      limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sources", force: :cascade do |t|
    t.integer  "carpool_id", limit: 4
    t.string   "source",     limit: 50
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.text     "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "picture_file_name",      limit: 255
    t.string   "picture_content_type",   limit: 255
    t.integer  "picture_file_size",      limit: 4
    t.datetime "picture_updated_at"
    t.string   "username",               limit: 50
    t.integer  "phone_number",           limit: 8
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.string   "oauth_token",            limit: 255
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag",    limit: 1
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
