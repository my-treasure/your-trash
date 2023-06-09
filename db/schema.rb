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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_193030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "booking_statuses", force: :cascade do |t|
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booking_id"
    t.boolean "completed"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.string "pick_up_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_bookings_on_offer_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.bigint "booker_id"
    t.bigint "offerer_id"
    t.index ["booking_id"], name: "index_chatrooms_on_booking_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "followed_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chatroom_id"
    t.string "content"
    t.boolean "read", default: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.string "pickupslots"
    t.string "typeofoffer"
    t.string "foodtype"
    t.string "allergen"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reviewer_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "username"
    t.text "info"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.string "role"
    t.boolean "admin", default: false, null: false
    t.binary "profile_image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "offers"
  add_foreign_key "bookings", "users"
  add_foreign_key "chatrooms", "bookings"
  add_foreign_key "chatrooms", "users", column: "booker_id"
  add_foreign_key "chatrooms", "users", column: "offerer_id"
  add_foreign_key "follows", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "offers", "users"
  add_foreign_key "reviews", "bookings", on_delete: :cascade
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
