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

ActiveRecord::Schema.define(version: 2021_11_20_115959) do

  create_table "endpoint_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "request_type", null: false
  end

  create_table "monitor_locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.integer "modified_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["modified_by_id"], name: "index_monitor_locations_on_modified_by_id"
  end

  create_table "networkpages", force: :cascade do |t|
    t.string "address"
    t.integer "addressindex"
    t.integer "monitor"
    t.string "status"
    t.float "relaytime"
    t.datetime "creation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_networkpages_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "address"
    t.string "user"
    t.datetime "creation"
    t.integer "delay"
    t.boolean "maintenance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "ssl_checks", force: :cascade do |t|
    t.integer "addressindex"
    t.integer "monitor"
    t.string "status"
    t.datetime "creation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "monitor_locations", "users", column: "modified_by_id"
end
