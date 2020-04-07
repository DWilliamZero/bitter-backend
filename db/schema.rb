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

ActiveRecord::Schema.define(version: 2020_04_07_142005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "followee_id"], name: "index_follows_on_follower_id_and_followee_id", unique: true
  end

  create_table "hates", force: :cascade do |t|
    t.boolean "hate"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_hates_on_post_id"
    t.index ["user_id"], name: "index_hates_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "image_url"
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "image_url"
    t.string "blurb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "follower_count", default: 0
    t.integer "followee_count", default: 0
  end

  add_foreign_key "hates", "posts"
  add_foreign_key "hates", "users"
  add_foreign_key "posts", "users"
end
