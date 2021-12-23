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

ActiveRecord::Schema.define(version: 2021_12_23_174713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "family_histories", force: :cascade do |t|
    t.boolean "mother"
    t.boolean "father"
    t.boolean "sister"
    t.boolean "brother"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "diagnosis", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_family_histories_on_user_id"
  end

  create_table "immunizations", force: :cascade do |t|
    t.json "name"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_immunizations_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name", null: false
    t.string "strength"
    t.string "route"
    t.string "frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_medications_on_user_id"
  end

  create_table "subjectives", force: :cascade do |t|
    t.text "description"
    t.integer "scale"
    t.string "location"
    t.string "observed_changes"
    t.datetime "start_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_subjectives_on_user_id"
  end

  create_table "surgeries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "date", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_surgeries_on_patient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.json "diagnoses", null: false
    t.string "allergies", null: false
    t.string "current_treatments", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "surgeries", "users", column: "patient_id"
end
