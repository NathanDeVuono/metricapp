# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140217180454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.decimal  "retail_hrs_per_ro"
    t.decimal  "elr_retail"
    t.decimal  "retail_ro_count"
    t.decimal  "tech_hrs_per_day"
    t.decimal  "salaries_as_percent_gross"
    t.decimal  "other_as_percent_gross"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_data", force: true do |t|
    t.integer  "user_id"
    t.datetime "month"
    t.integer  "total_hours_sold"
    t.integer  "retail_hours_sold"
    t.integer  "total_labour_sales"
    t.integer  "retail_labour_sales"
    t.integer  "work_days_per_tech"
    t.integer  "number_of_techs"
    t.integer  "retail_ro_count"
    t.integer  "total_gross"
    t.integer  "total_variable_expense"
    t.integer  "total_salaries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
