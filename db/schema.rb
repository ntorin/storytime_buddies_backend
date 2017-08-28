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

ActiveRecord::Schema.define(version: 20170828104102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "library_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "likes"
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lobbies", force: :cascade do |t|
    t.string   "name"
    t.boolean  "has_password"
    t.string   "password"
    t.integer  "word_limit"
    t.integer  "master_user_id"
    t.integer  "members"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "story_id"
  end

  create_table "lobbies_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "lobby_id", null: false
  end

  create_table "lobby_messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "lobby_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
  end

  create_table "lobby_users", force: :cascade do |t|
    t.integer  "lobby_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_lobby_users_on_lobby_id", using: :btree
    t.index ["user_id"], name: "index_lobby_users_on_user_id", using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "name"
    t.integer  "author_id"
    t.text     "passage"
    t.boolean  "editing"
    t.boolean  "completed"
    t.integer  "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "story_id", null: false
  end

  create_table "story_users", force: :cascade do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_story_users_on_story_id", using: :btree
    t.index ["user_id"], name: "index_story_users_on_user_id", using: :btree
  end

  create_table "user_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_user_users_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_user_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "role"
    t.integer  "stories_started"
    t.integer  "stories_joined"
    t.integer  "library_comments"
    t.integer  "total_story_views"
    t.integer  "total_friends"
    t.integer  "total_profile_views"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "users_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
  end

end
