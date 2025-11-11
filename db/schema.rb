# This file is auto-generated from the current state of the database.

ActiveRecord::Schema[8.1].define(version: 2025_11_15_101255) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.decimal "price", precision: 8, scale: 2
    t.integer "stock", default: 0
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
