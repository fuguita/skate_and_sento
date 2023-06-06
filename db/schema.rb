# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_06_132618) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "park_favorites", force: :cascade do |t|
    t.integer "park_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "park_reviews", force: :cascade do |t|
    t.integer "park_id", null: false
    t.integer "user_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "park_sections", force: :cascade do |t|
    t.integer "park_id", null: false
    t.integer "section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "park_sentos", force: :cascade do |t|
    t.integer "park_id", null: false
    t.integer "sento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parks", force: :cascade do |t|
    t.integer "prefecture_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "telephone_number", null: false
    t.string "business_hour", null: false
    t.string "holiday", null: false
    t.integer "price", null: false
    t.string "parking", null: false
    t.string "helmet", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "prefecture_id", null: false
    t.string "park", null: false
    t.string "sento", null: false
    t.text "park_caption", null: false
    t.text "sento_caption", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sento_favorites", force: :cascade do |t|
    t.integer "sento_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sento_reviews", force: :cascade do |t|
    t.integer "sento_id", null: false
    t.integer "user_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sentos", force: :cascade do |t|
    t.integer "prefecture_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "telephone_number", null: false
    t.string "business_hour", null: false
    t.string "holiday", null: false
    t.integer "price", null: false
    t.string "parking", null: false
    t.boolean "sauna", default: true, null: false
    t.integer "temperature", null: false
    t.string "towel", null: false
    t.string "soap", null: false
    t.boolean "open_air_bath", default: true, null: false
    t.boolean "cold_bath", default: true, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
