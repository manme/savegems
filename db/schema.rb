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

ActiveRecord::Schema.define(version: 20150113115208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gem_notes", force: true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "require"
    t.string   "groups"
    t.string   "platforms"
    t.string   "source"
    t.string   "git"
    t.string   "github"
    t.string   "path"
    t.text     "description"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "branch"
    t.string   "tag"
    t.string   "ref"
    t.string   "submodules"
    t.string   "hashid"
    t.string   "original"
    t.integer  "user_id"
  end

  create_table "gemfiles", force: true do |t|
    t.text     "content"
    t.string   "name"
    t.string   "hashid"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "access_token"
    t.string   "email"
    t.string   "utoken"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "nickname"
    t.text     "image"
  end

  add_index "users", ["utoken"], name: "index_users_on_utoken", unique: true, using: :btree

end
