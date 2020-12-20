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

ActiveRecord::Schema.define(version: 2020_12_20_132124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "privacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bookmark_id"
    t.index ["bookmark_id"], name: "index_categories_on_bookmark_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "privacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "url_name"
    t.string "urlable_type"
    t.bigint "urlable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["urlable_type", "urlable_id"], name: "index_urls_on_urlable_type_and_urlable_id"
  end

  add_foreign_key "categories", "bookmarks"
  add_foreign_key "sub_categories", "categories"
end
