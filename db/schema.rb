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

ActiveRecord::Schema.define(version: 20160715105057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_counter", default: 0
    t.date     "scheduled_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "documentations", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "cover_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "given_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "answers",     default: [],              array: true
    t.boolean  "is_correct"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["question_id"], name: "index_given_answers_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "body"
    t.text     "answers",          default: [],              array: true
    t.text     "correct_answers",  default: [],              array: true
    t.text     "explanation"
    t.integer  "documentation_id"
    t.integer  "answer_counter",   default: 0
    t.integer  "positive_rates",   default: 0
    t.integer  "negative_rates",   default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "author_id"
    t.index ["author_id"], name: "index_questions_on_author_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name",                              null: false
    t.string   "first_name",                             null: false
    t.string   "cis",                                    null: false
    t.string   "rank",                                   null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
