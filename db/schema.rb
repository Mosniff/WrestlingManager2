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

ActiveRecord::Schema.define(version: 20190817122317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.integer "prestige"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_performers", force: :cascade do |t|
    t.bigint "performer_id"
    t.bigint "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_performers_on_match_id"
    t.index ["performer_id"], name: "index_match_performers_on_performer_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "match_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promotion_id"
    t.index ["promotion_id"], name: "index_matches_on_promotion_id"
  end

  create_table "performers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promotion_id"
    t.string "body_type"
    t.integer "size"
    t.integer "strength"
    t.integer "agility"
    t.string "gender"
    t.integer "age"
    t.integer "wrestling_ability"
    t.integer "work_rate"
    t.integer "selling"
    t.index ["promotion_id"], name: "index_performers_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cash"
    t.index ["user_id"], name: "index_promotions_on_user_id"
  end

  create_table "title_reigns", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "performer_id"
    t.bigint "championship_id"
    t.boolean "is_current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_title_reigns_on_championship_id"
    t.index ["performer_id"], name: "index_title_reigns_on_performer_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "match_performers", "matches"
  add_foreign_key "match_performers", "performers"
  add_foreign_key "matches", "promotions"
  add_foreign_key "performers", "promotions"
  add_foreign_key "promotions", "users"
  add_foreign_key "title_reigns", "championships"
  add_foreign_key "title_reigns", "performers"
end
