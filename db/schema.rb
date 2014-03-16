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

ActiveRecord::Schema.define(version: 20140316105817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "announcements", ["course_id"], name: "index_announcements_on_course_id", using: :btree
  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "answers", force: true do |t|
    t.boolean  "correct"
    t.string   "answer"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "answers_question_results", force: true do |t|
    t.integer "answer_id"
    t.integer "question_result_id"
  end

  add_index "answers_question_results", ["answer_id", "question_result_id"], name: "q_r_a_index", using: :btree

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

  create_table "categories_courses", id: false, force: true do |t|
    t.integer  "category_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_courses", ["category_id", "course_id"], name: "index_categories_courses_on_category_id_and_course_id", using: :btree

  create_table "cms_blocks", force: true do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_blocks", ["blockable_id", "blockable_type"], name: "index_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "cms_blocks", ["identifier"], name: "index_cms_blocks_on_identifier", using: :btree

  create_table "cms_categories", force: true do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_categorized_type_and_label", unique: true, using: :btree

  create_table "cms_categorizations", force: true do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "cms_files", force: true do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_files", ["site_id", "block_id"], name: "index_cms_files_on_site_id_and_block_id", using: :btree
  add_index "cms_files", ["site_id", "file_file_name"], name: "index_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "cms_files", ["site_id", "label"], name: "index_cms_files_on_site_id_and_label", using: :btree
  add_index "cms_files", ["site_id", "position"], name: "index_cms_files_on_site_id_and_position", using: :btree

  create_table "cms_layouts", force: true do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_layouts", ["parent_id", "position"], name: "index_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "cms_layouts", ["site_id", "identifier"], name: "index_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "cms_pages", force: true do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_pages", ["parent_id", "position"], name: "index_cms_pages_on_parent_id_and_position", using: :btree
  add_index "cms_pages", ["site_id", "full_path"], name: "index_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "cms_revisions", force: true do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "cms_sites", force: true do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "cms_sites", ["hostname"], name: "index_cms_sites_on_hostname", using: :btree
  add_index "cms_sites", ["is_mirrored"], name: "index_cms_sites_on_is_mirrored", using: :btree

  create_table "cms_snippets", force: true do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_snippets", ["site_id", "identifier"], name: "index_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "cms_snippets", ["site_id", "position"], name: "index_cms_snippets_on_site_id_and_position", using: :btree

  create_table "course_progresses", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "next_video_id"
    t.integer  "last_video_id"
  end

  add_index "course_progresses", ["course_id"], name: "index_course_progresses_on_course_id", using: :btree
  add_index "course_progresses", ["last_video_id"], name: "index_course_progresses_on_last_video_id", using: :btree
  add_index "course_progresses", ["next_video_id"], name: "index_course_progresses_on_next_video_id", using: :btree
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
    t.string   "slug"
  end

  add_index "courses", ["category_id"], name: "index_courses_on_category_id", using: :btree
  add_index "courses", ["slug"], name: "index_courses_on_slug", unique: true, using: :btree
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

  create_table "forem_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "pending_review"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,            null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "pending_review"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "forums", force: true do |t|
    t.string   "state"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topics_count", default: 0
  end

  add_index "forums", ["course_id"], name: "index_forums_on_course_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["course_id"], name: "index_participations_on_course_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

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

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "stars"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["course_id"], name: "index_reviews_on_course_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

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
    t.boolean  "complete",                default: false
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
    t.integer  "position"
  end

  add_index "steps", ["course_id"], name: "index_steps_on_course_id", using: :btree
  add_index "steps", ["position"], name: "index_steps_on_position", using: :btree

  create_table "topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "posts_count", default: 0
    t.boolean  "sticky",      default: false
    t.boolean  "locked",      default: false
  end

  add_index "topics", ["forum_id"], name: "index_topics_on_forum_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
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
    t.integer  "position"
  end

  add_index "videos", ["position", "step_id"], name: "index_videos_on_position_and_step_id", unique: true, using: :btree
  add_index "videos", ["step_id"], name: "index_videos_on_step_id", using: :btree

  create_table "videos_step_progresses", force: true do |t|
    t.integer "video_id"
    t.integer "step_progress_id"
  end

  add_index "videos_step_progresses", ["step_progress_id", "video_id"], name: "s_p_v_index", using: :btree

end
