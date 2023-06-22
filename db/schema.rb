
ActiveRecord::Schema[7.0].define(version: 2023_06_21_121645) do

  # Database Type
  enable_extension "plpgsql"

  # Database Schema for Book table creation
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.integer "publication_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # Database Schema for User table creation
  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
