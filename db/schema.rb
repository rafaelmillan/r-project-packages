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

ActiveRecord::Schema.define(version: 2018_12_03_202102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "latest_version_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_version_id"], name: "index_packages_on_latest_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "number", null: false
    t.datetime "date_publication"
    t.string "title"
    t.text "description"
    t.string "author"
    t.string "maintainers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "package_id"
    t.index ["package_id"], name: "index_versions_on_package_id"
  end

  add_foreign_key "packages", "versions", column: "latest_version_id"
end
