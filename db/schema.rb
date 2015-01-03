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

ActiveRecord::Schema.define(version: 20150103094606) do

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
  end

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
