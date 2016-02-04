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

ActiveRecord::Schema.define(version: 20160204164412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approves", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "steward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "approves", ["steward_id"], name: "index_approves_on_steward_id", using: :btree
  add_index "approves", ["user_id"], name: "index_approves_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashs", id: false, force: :cascade do |t|
    t.integer  "id",         default: 0, null: false
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stewards", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "stewards", ["group_id"], name: "index_stewards_on_group_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "record_book_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group"
    t.integer  "group_id"
    t.integer  "groups_id"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree
  add_index "students", ["groups_id"], name: "index_students_on_groups_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.integer  "hashs_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  add_index "users", ["hashs_id"], name: "index_users_on_hashs_id", using: :btree

  create_table "users_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_roles", ["role_id"], name: "index_users_roles_on_role_id", using: :btree
  add_index "users_roles", ["user_id"], name: "index_users_roles_on_user_id", using: :btree

  add_foreign_key "approves", "stewards"
  add_foreign_key "approves", "users"
  add_foreign_key "stewards", "groups"
  add_foreign_key "stewards", "students"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
