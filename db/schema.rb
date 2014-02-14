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

ActiveRecord::Schema.define(version: 20140214112549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.boolean  "correct"
    t.string   "answer"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "attachments", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.string   "unique_id"
    t.string   "s3_filepath"
    t.text     "description"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "processed",         default: false, null: false
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "position"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "categories_courses", force: true do |t|
    t.integer  "category_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_courses", ["category_id", "course_id"], name: "index_categories_courses_on_category_id_and_course_id", using: :btree

  create_table "course_progresses", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_progresses", ["course_id"], name: "index_course_progresses_on_course_id", using: :btree
  add_index "course_progresses", ["user_id"], name: "index_course_progresses_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "category_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["status"], name: "index_courses_on_status", using: :btree

  create_table "exam_progresses", force: true do |t|
    t.integer  "exam_id"
    t.integer  "step_progress_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_progresses", ["exam_id"], name: "index_exam_progresses_on_exam_id", using: :btree
  add_index "exam_progresses", ["step_progress_id"], name: "index_exam_progresses_on_step_progress_id", using: :btree

  create_table "exams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "examable_id"
    t.string   "examable_type"
  end

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["course_id"], name: "index_participations_on_course_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "question_results", force: true do |t|
    t.integer  "exam_progress_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_results", ["answer_id"], name: "index_question_results_on_answer_id", using: :btree
  add_index "question_results", ["exam_progress_id"], name: "index_question_results_on_exam_progress_id", using: :btree
  add_index "question_results", ["question_id"], name: "index_question_results_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "kind"
    t.string   "question"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["exam_id"], name: "index_questions_on_exam_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "step_progresses", force: true do |t|
    t.integer  "step_id"
    t.integer  "course_progress_id"
    t.integer  "last_watched_video_id"
    t.boolean  "last_watched_video_exam"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "step_progresses", ["course_progress_id"], name: "index_step_progresses_on_course_progress_id", using: :btree
  add_index "step_progresses", ["last_watched_video_id"], name: "index_step_progresses_on_last_watched_video_id", using: :btree
  add_index "step_progresses", ["step_id"], name: "index_step_progresses_on_step_id", using: :btree

  create_table "steps", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "steps", ["course_id"], name: "index_steps_on_course_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "yt_id"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step_id"
    t.integer  "postion"
  end

  add_index "videos", ["postion"], name: "index_videos_on_postion", unique: true, using: :btree
  add_index "videos", ["step_id"], name: "index_videos_on_step_id", using: :btree

end
