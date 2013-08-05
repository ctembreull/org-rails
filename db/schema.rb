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

ActiveRecord::Schema.define(version: 20130805193909) do

  create_table "franchises", force: true do |t|
    t.string   "abbr"
    t.string   "city"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.string   "abbr",       limit: 3
    t.string   "name"
    t.string   "level",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "league_id"
    t.string   "abbr",         limit: 3
    t.string   "city"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["franchise_id"], name: "index_teams_on_franchise_id"
  add_index "teams", ["league_id"], name: "index_teams_on_league_id"

end
