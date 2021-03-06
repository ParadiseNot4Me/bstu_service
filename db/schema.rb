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

ActiveRecord::Schema.define(version: 20160525094511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "approves", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "steward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "approves", ["steward_id"], name: "index_approves_on_steward_id", using: :btree
  add_index "approves", ["user_id"], name: "index_approves_on_user_id", using: :btree

  create_table "cabinets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finally_marks", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "student_id"
    t.integer  "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "finally_marks", ["student_id"], name: "index_finally_marks_on_student_id", using: :btree
  add_index "finally_marks", ["subject_id"], name: "index_finally_marks_on_subject_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lab_progress_student_progresses", force: :cascade do |t|
    t.integer  "lab_progress_id"
    t.integer  "student_progress_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "lab_progress_student_progresses", ["lab_progress_id"], name: "index_lab_progress_student_progresses_on_lab_progress_id", using: :btree
  add_index "lab_progress_student_progresses", ["student_progress_id"], name: "index_lab_progress_student_progresses_on_student_progress_id", using: :btree

  create_table "lab_progresses", force: :cascade do |t|
    t.integer  "lab_work_id"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "mark"
    t.integer  "intime"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lab_progresses", ["lab_work_id"], name: "index_lab_progresses_on_lab_work_id", using: :btree
  add_index "lab_progresses", ["student_id"], name: "index_lab_progresses_on_student_id", using: :btree
  add_index "lab_progresses", ["subject_id"], name: "index_lab_progresses_on_subject_id", using: :btree

  create_table "lab_works", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "n"
    t.date     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lab_works", ["subject_id"], name: "index_lab_works_on_subject_id", using: :btree

  create_table "lesson_days", force: :cascade do |t|
    t.integer  "n"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_times", force: :cascade do |t|
    t.time     "start"
    t.time     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "n"
  end

  create_table "lesson_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_week_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedule_field_groups", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "schedule_field_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "schedule_field_groups", ["group_id"], name: "index_schedule_field_groups_on_group_id", using: :btree
  add_index "schedule_field_groups", ["schedule_field_id"], name: "index_schedule_field_groups_on_schedule_field_id", using: :btree

  create_table "schedule_fields", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "lesson_time_id"
    t.integer  "lesson_day_id"
    t.integer  "lesson_week_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "lesson_type_id"
    t.integer  "cabinet_id"
  end

  add_index "schedule_fields", ["cabinet_id"], name: "index_schedule_fields_on_cabinet_id", using: :btree
  add_index "schedule_fields", ["lesson_day_id"], name: "index_schedule_fields_on_lesson_day_id", using: :btree
  add_index "schedule_fields", ["lesson_time_id"], name: "index_schedule_fields_on_lesson_time_id", using: :btree
  add_index "schedule_fields", ["lesson_type_id"], name: "index_schedule_fields_on_lesson_type_id", using: :btree
  add_index "schedule_fields", ["lesson_week_type_id"], name: "index_schedule_fields_on_lesson_week_type_id", using: :btree
  add_index "schedule_fields", ["subject_id"], name: "index_schedule_fields_on_subject_id", using: :btree

  create_table "stewards", force: :cascade do |t|
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "stewards", ["group_id"], name: "index_stewards_on_group_id", using: :btree
  add_index "stewards", ["group_id"], name: "stewards_group_id_uindex", unique: true, using: :btree
  add_index "stewards", ["student_id"], name: "stewards_student_id_uindex", unique: true, using: :btree

  create_table "student_progresses", force: :cascade do |t|
    t.date     "date"
    t.integer  "schedule_field_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "group_id"
    t.integer  "student_id"
    t.integer  "attendance"
    t.integer  "mark"
    t.integer  "intime"
  end

  add_index "student_progresses", ["group_id"], name: "index_student_progresses_on_group_id", using: :btree
  add_index "student_progresses", ["schedule_field_id"], name: "index_student_progresses_on_schedule_field_id", using: :btree
  add_index "student_progresses", ["student_id"], name: "index_student_progresses_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "record_book_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "users_id"
  end

  add_index "students", ["group_id"], name: "index_students_on_group_id", using: :btree
  add_index "students", ["users_id"], name: "index_students_on_users_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "practic_teacher_id"
  end

  add_index "subjects", ["practic_teacher_id"], name: "index_subjects_on_practic_teacher_id", using: :btree
  add_index "subjects", ["teacher_id"], name: "index_subjects_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "users_id"
  end

  add_index "teachers", ["users_id"], name: "index_teachers_on_users_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.integer  "hashs_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "teachers_id"
    t.integer  "students_id"
  end

  add_index "users", ["hashs_id"], name: "index_users_on_hashs_id", using: :btree
  add_index "users", ["students_id"], name: "index_users_on_students_id", using: :btree
  add_index "users", ["teachers_id"], name: "index_users_on_teachers_id", using: :btree

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
  add_foreign_key "finally_marks", "students"
  add_foreign_key "finally_marks", "subjects"
  add_foreign_key "lab_progress_student_progresses", "lab_progresses"
  add_foreign_key "lab_progress_student_progresses", "student_progresses"
  add_foreign_key "lab_progresses", "lab_works"
  add_foreign_key "lab_progresses", "students"
  add_foreign_key "lab_progresses", "subjects"
  add_foreign_key "lab_works", "subjects"
  add_foreign_key "schedule_field_groups", "groups"
  add_foreign_key "schedule_field_groups", "groups", name: "schedule_field_groups_groups_id_fk"
  add_foreign_key "schedule_field_groups", "schedule_fields"
  add_foreign_key "schedule_fields", "cabinets"
  add_foreign_key "schedule_fields", "lesson_days"
  add_foreign_key "schedule_fields", "lesson_times"
  add_foreign_key "schedule_fields", "lesson_types"
  add_foreign_key "schedule_fields", "lesson_week_types"
  add_foreign_key "schedule_fields", "subjects"
  add_foreign_key "stewards", "groups"
  add_foreign_key "stewards", "students"
  add_foreign_key "student_progresses", "groups"
  add_foreign_key "student_progresses", "schedule_fields"
  add_foreign_key "student_progresses", "students"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "teachers", "users"
  add_foreign_key "users", "students"
  add_foreign_key "users", "teachers"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
