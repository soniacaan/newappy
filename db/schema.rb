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

ActiveRecord::Schema.define(version: 20160324064243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albumns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  add_index "comments", ["micropost_id"], name: "index_comments_on_micropost_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "covers", force: :cascade do |t|
    t.text     "name"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "micropost_types", force: :cascade do |t|
    t.text     "type"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "micropost_types", ["micropost_id"], name: "index_micropost_types_on_micropost_id", using: :btree

  create_table "microposts", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.integer  "post_type"
    t.integer  "micro_type"
    t.string   "type_micro"
    t.string   "slug"
  end

  add_index "microposts", ["slug"], name: "index_microposts_on_slug", using: :btree
  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "photo_albumns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "albumn_id"
  end

  add_index "photo_albumns", ["albumn_id"], name: "index_photo_albumns_on_albumn_id", using: :btree

  create_table "spud_permissions", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "tag",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_permissions", ["tag"], name: "index_spud_permissions_on_tag", unique: true, using: :btree

  create_table "spud_photo_albums", force: :cascade do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_photo_albums", ["url_name"], name: "idx_album_url_name", using: :btree

  create_table "spud_photo_albums_photos", force: :cascade do |t|
    t.integer "spud_photo_album_id"
    t.integer "spud_photo_id"
    t.integer "sort_order",          default: 0
  end

  add_index "spud_photo_albums_photos", ["spud_photo_album_id"], name: "idx_album_id", using: :btree

  create_table "spud_photo_galleries", force: :cascade do |t|
    t.string   "title"
    t.string   "url_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_photo_galleries", ["url_name"], name: "idx_gallery_url_name", using: :btree

  create_table "spud_photo_galleries_albums", force: :cascade do |t|
    t.integer "spud_photo_gallery_id"
    t.integer "spud_photo_album_id"
    t.integer "sort_order",            default: 0
  end

  add_index "spud_photo_galleries_albums", ["spud_photo_gallery_id"], name: "idx_gallery_id", using: :btree

  create_table "spud_photos", force: :cascade do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_role_permissions", force: :cascade do |t|
    t.integer  "spud_role_id",        null: false
    t.string   "spud_permission_tag", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spud_role_permissions", ["spud_permission_tag"], name: "index_spud_role_permissions_on_spud_permission_tag", using: :btree
  add_index "spud_role_permissions", ["spud_role_id"], name: "index_spud_role_permissions_on_spud_role_id", using: :btree

  create_table "spud_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_user_settings", force: :cascade do |t|
    t.integer  "spud_user_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spud_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "super_admin"
    t.string   "login",                           null: false
    t.string   "email",                           null: false
    t.string   "crypted_password",                null: false
    t.string   "password_salt",                   null: false
    t.string   "persistence_token",               null: false
    t.string   "single_access_token",             null: false
    t.string   "perishable_token",                null: false
    t.integer  "login_count",         default: 0, null: false
    t.integer  "failed_login_count",  default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
    t.integer  "spud_role_id"
  end

  add_index "spud_users", ["email"], name: "index_spud_users_on_email", using: :btree
  add_index "spud_users", ["login"], name: "index_spud_users_on_login", using: :btree
  add_index "spud_users", ["spud_role_id"], name: "index_spud_users_on_spud_role_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.datetime "reset_sent_at"
    t.string   "reset_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "users"
  add_foreign_key "micropost_types", "microposts"
  add_foreign_key "microposts", "users"
  add_foreign_key "photo_albumns", "albumns"
end
