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

ActiveRecord::Schema[7.1].define(version: 2024_04_19_003619) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "amiibo_series", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amiibos", force: :cascade do |t|
    t.string "name"
    t.datetime "release_date"
    t.integer "amiibo_series_id", null: false
    t.integer "game_series_id", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.decimal "price", precision: 4, scale: 2
    t.index ["amiibo_series_id"], name: "index_amiibos_on_amiibo_series_id"
    t.index ["character_id"], name: "index_amiibos_on_character_id"
    t.index ["game_series_id"], name: "index_amiibos_on_game_series_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "fullName"
    t.string "username"
    t.string "password"
    t.string "city"
    t.string "postalCode"
    t.integer "provinceId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_series", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_amiibos", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "unitPrice"
    t.integer "orderId"
    t.integer "amiiboId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "orderDate"
    t.integer "customerId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "provinceName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amiibos", "amiibo_series"
  add_foreign_key "amiibos", "amiibo_series"
  add_foreign_key "amiibos", "characters"
  add_foreign_key "amiibos", "characters"
  add_foreign_key "amiibos", "game_series"
  add_foreign_key "amiibos", "game_series"
  add_foreign_key "customers", "provinces", column: "provinceId"
  add_foreign_key "order_amiibos", "amiibos", column: "amiiboId"
  add_foreign_key "order_amiibos", "orders", column: "orderId"
  add_foreign_key "orders", "customers", column: "customerId"
end
