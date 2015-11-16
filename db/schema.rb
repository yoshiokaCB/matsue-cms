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

ActiveRecord::Schema.define(version: 20150718023827) do

  create_table "admin_categories", force: :cascade do |t|
    t.string   "display_name"
    t.string   "url_name"
    t.text     "description"
    t.integer  "status"
    t.datetime "date"
    t.integer  "date_visible"
    t.integer  "tree_type"
    t.integer  "body_id"
    t.integer  "default_body_id"
    t.integer  "meta_id"
    t.integer  "lock_version"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "admin_pages", force: :cascade do |t|
    t.string   "display_name"
    t.string   "sub_display_name"
    t.string   "url_name"
    t.text     "description"
    t.integer  "status"
    t.datetime "date"
    t.integer  "date_visible"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "redirect_url"
    t.integer  "redirect_target"
    t.text     "body_text"
    t.integer  "body_id"
    t.integer  "meta_id"
    t.integer  "replace_id"
    t.integer  "lock_version"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "admin_site_structures", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "category_id"
    t.integer  "parent_id"
    t.string   "routes"
    t.integer  "category_primary"
    t.integer  "children_pages_count"
    t.integer  "children_categories_count"
    t.integer  "is_sub_display_name"
    t.integer  "depth"
    t.integer  "sort"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
