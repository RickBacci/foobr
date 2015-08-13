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

ActiveRecord::Schema.define(version: 20150813153905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.integer  "developer_id"
    t.integer  "client_id"
    t.string   "hire",                      array: true
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "specialties", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "specialty_name"
  end

  add_index "specialties", ["user_id"], name: "index_specialties_on_user_id", using: :btree

  create_table "user_specialties", force: :cascade do |t|
    t.integer "user_id"
    t.integer "specialty_id"
  end

  add_index "user_specialties", ["specialty_id"], name: "index_user_specialties_on_specialty_id", using: :btree
  add_index "user_specialties", ["user_id"], name: "index_user_specialties_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
    t.string   "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "company_name"
    t.string   "experience"
    t.string   "foobr_calendar_id"
  end

  add_foreign_key "projects", "users"
  add_foreign_key "specialties", "users"
  add_foreign_key "user_specialties", "specialties"
  add_foreign_key "user_specialties", "users"
end
