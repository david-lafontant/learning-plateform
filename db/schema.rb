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

ActiveRecord::Schema[7.0].define(version: 2024_07_17_033014) do
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

  create_table "course_enrollements", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_enrollements_on_course_id"
    t.index ["student_id"], name: "index_course_enrollements_on_student_id"
  end

  create_table "course_modules", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_modules_on_course_id"
  end

  create_table "course_trainings", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "training_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_trainings_on_course_id"
    t.index ["training_id"], name: "index_course_trainings_on_training_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.integer "credit"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "enrollement_trainings", force: :cascade do |t|
    t.bigint "training_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_enrollement_trainings_on_student_id"
    t.index ["training_id"], name: "index_enrollement_trainings_on_training_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.float "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_grades_on_course_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "course_module_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_module_id"], name: "index_lessons_on_course_module_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "course_enrollements", "courses"
  add_foreign_key "course_enrollements", "users", column: "student_id"
  add_foreign_key "course_modules", "courses"
  add_foreign_key "course_trainings", "courses"
  add_foreign_key "course_trainings", "trainings"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "enrollement_trainings", "trainings"
  add_foreign_key "enrollement_trainings", "users", column: "student_id"
  add_foreign_key "grades", "courses"
  add_foreign_key "grades", "users", column: "student_id"
  add_foreign_key "lessons", "course_modules"
end
