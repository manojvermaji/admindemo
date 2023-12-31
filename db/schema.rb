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

ActiveRecord::Schema[7.0].define(version: 2023_10_30_093701) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

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

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "avtars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "share_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_comments_on_share_id"
  end

  create_table "employee_attendances", force: :cascade do |t|
    t.date "date"
    t.string "attendence"
    t.string "mode_of_work"
    t.integer "working_hours"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_attendances_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hollydays", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "allow", default: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company_name"
    t.decimal "min_salary"
    t.decimal "max_salary"
    t.text "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "share_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_likes_on_share_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "personal_details", force: :cascade do |t|
    t.string "phone_number"
    t.string "email"
    t.string "gender"
    t.string "dob"
    t.string "marital_status"
    t.string "blood_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "video"
    t.string "hobbies"
    t.text "work_experiences"
    t.text "education"
  end

  create_table "post_shares", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "share_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_post_shares_on_share_id"
    t.index ["user_id"], name: "index_post_shares_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "shares", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes_count"
    t.string "image"
    t.string "video"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "shares"
  add_foreign_key "employee_attendances", "employees"
  add_foreign_key "likes", "shares"
  add_foreign_key "likes", "users"
  add_foreign_key "post_shares", "shares"
  add_foreign_key "post_shares", "users"
  add_foreign_key "posts", "users"
end
