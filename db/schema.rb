# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_06_030326) do

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "image_url"
    t.text "description"
    t.string "image"
    t.string "smalltitle_01"
    t.text "description_01"
    t.string "image_01"
    t.string "smalltitle_02"
    t.text "description_02"
    t.string "image_02"
    t.string "smalltitle_03"
    t.text "description_03"
    t.string "image_03"
    t.string "smalltitle_04"
    t.text "description_04"
    t.string "image_04"
    t.string "smalltitle_05"
    t.text "description_05"
    t.string "image_05"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "image_url"
    t.text "description"
    t.string "smalltitle"
    t.text "destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

end
