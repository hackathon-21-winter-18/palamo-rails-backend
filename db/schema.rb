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

ActiveRecord::Schema[7.0].define(version: 2022_02_15_025130) do
  create_table "embeded_pins", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "number", null: false
    t.integer "x", null: false
    t.integer "y", null: false
    t.string "word", limit: 15
    t.string "place", limit: 15
    t.string "situation", limit: 15
    t.string "palace_id", limit: 36, null: false
    t.integer "group_number", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["palace_id"], name: "fk_rails_a46c920936"
  end

  create_table "palaces", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "originalID", limit: 36, null: false
    t.string "name", limit: 30, null: false
    t.string "created_by", limit: 36, null: false
    t.string "held_by", limit: 36, null: false
    t.integer "number_of_embeded_pins", default: 0
    t.boolean "share", default: false
    t.integer "saved_count", default: 0
    t.datetime "shared_at"
    t.boolean "firstshared", default: false
    t.datetime "firstshared_at"
    t.string "group1", default: ""
    t.string "group2", default: ""
    t.string "group3", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: { type: :string, limit: 36 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "google_id", limit: 21, null: false
    t.string "name", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "embeded_pins", "palaces"
end
