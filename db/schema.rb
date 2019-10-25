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

ActiveRecord::Schema.define(version: 2019_10_22_202312) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "abv"
    t.text "description"
    t.string "style"
    t.string "brewery"
    t.string "location"
    t.boolean "is_organic"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.text "description"
    t.integer "rating"
  end

  create_table "taprooms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.boolean "is_loved"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.text "about_me"
  end

end
