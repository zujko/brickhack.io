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

ActiveRecord::Schema.define(version: 20170128063020) do

  create_table "blazer_audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "query_id"
    t.text     "statement",   limit: 65535
    t.string   "data_source"
    t.datetime "created_at"
  end

  create_table "blazer_checks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "creator_id"
    t.integer  "query_id"
    t.string   "state"
    t.string   "schedule"
    t.text     "emails",      limit: 65535
    t.string   "check_type"
    t.text     "message",     limit: 65535
    t.datetime "last_run_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "blazer_dashboard_queries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "dashboard_id"
    t.integer  "query_id"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "blazer_dashboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "creator_id"
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "blazer_queries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description", limit: 65535
    t.text     "statement",   limit: 65535
    t.string   "data_source"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "bus_lists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity",                        default: 50
    t.text     "notes",             limit: 65535
    t.boolean  "needs_bus_captain",               default: false
  end

  create_table "fips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "fips_code"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "recipients"
    t.text     "body",         limit: 65535
    t.datetime "queued_at"
    t.datetime "started_at"
    t.datetime "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "template",                   default: "default"
  end

  create_table "questionnaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "experience"
    t.string   "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shirt_size"
    t.string   "dietary_restrictions"
    t.boolean  "international"
    t.string   "portfolio_url"
    t.string   "vcs_url"
    t.integer  "user_id"
    t.boolean  "agreement_accepted",       default: false
    t.string   "acc_status",               default: "pending"
    t.integer  "acc_status_author_id"
    t.datetime "acc_status_date"
    t.boolean  "riding_bus",               default: false
    t.boolean  "bus_captain_interest",     default: false
    t.boolean  "is_bus_captain",           default: false
    t.integer  "checked_in_by_id"
    t.datetime "checked_in_at"
    t.string   "phone"
    t.boolean  "can_share_info",           default: false
    t.boolean  "code_of_conduct_accepted", default: false
    t.string   "special_needs"
    t.string   "gender"
    t.string   "major"
    t.boolean  "travel_not_from_school",   default: false
    t.string   "travel_location"
    t.boolean  "data_sharing_accepted"
    t.string   "level_of_study"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "interest"
    t.index ["user_id"], name: "index_questionnaires_on_user_id", using: :btree
  end

  create_table "school_name_duplicates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_name_duplicates_on_school_id", using: :btree
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questionnaire_count"
    t.integer  "bus_list_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.boolean  "admin_limited_access",   default: false
    t.string   "provider"
    t.string   "uid"
    t.datetime "reminder_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "item_type",  limit: 191,        null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "school_name_duplicates", "schools"
end
