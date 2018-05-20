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

ActiveRecord::Schema.define(version: 20180520140932) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "meaning_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_comments_on_meaning_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "reply"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "dictions", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.boolean "public_flg", default: false
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_parent"
    t.boolean "default_public_flg", default: false, null: false
    t.index ["group_id"], name: "index_dictions_on_group_id"
    t.index ["user_id"], name: "index_dictions_on_user_id"
  end

  create_table "favorite_dictions", force: :cascade do |t|
    t.integer "diction_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diction_id"], name: "index_favorite_dictions_on_diction_id"
    t.index ["user_id"], name: "index_favorite_dictions_on_user_id"
  end

  create_table "favorite_meanings", force: :cascade do |t|
    t.integer "meaning_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_favorite_meanings_on_meaning_id"
    t.index ["user_id"], name: "index_favorite_meanings_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hits", force: :cascade do |t|
    t.integer "public_id"
    t.integer "meaning_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["meaning_id"], name: "index_hits_on_meaning_id"
    t.index ["public_id"], name: "index_hits_on_public_id"
    t.index ["user_id"], name: "index_hits_on_user_id"
  end

  create_table "meanings", force: :cascade do |t|
    t.text "content"
    t.boolean "public_flg", default: false
    t.integer "word_id"
    t.string "word_name"
    t.string "word_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "word_category_parent"
    t.string "word_kana"
    t.index ["word_id"], name: "index_meanings_on_word_id"
  end

  create_table "publics", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
    t.string "category_parent"
  end

  create_table "reports", force: :cascade do |t|
    t.string "reason"
    t.integer "user_id"
    t.integer "diction_id"
    t.integer "word_id"
    t.integer "meaning_id"
    t.integer "comment_id"
    t.boolean "deal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_reports_on_comment_id"
    t.index ["diction_id"], name: "index_reports_on_diction_id"
    t.index ["meaning_id"], name: "index_reports_on_meaning_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
    t.index ["word_id"], name: "index_reports_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "gender"
    t.date "birthday"
    t.string "image_id"
    t.string "user_word"
    t.boolean "user_flg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.string "category"
    t.integer "diction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_parent"
    t.index ["diction_id"], name: "index_words_on_diction_id"
  end

end
