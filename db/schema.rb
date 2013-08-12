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

ActiveRecord::Schema.define(version: 20130812201454) do

  create_table "disabled_players", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "length"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "reason"
    t.boolean  "rehab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disabled_players", ["franchise_id"], name: "index_disabled_players_on_franchise_id"
  add_index "disabled_players", ["player_id"], name: "index_disabled_players_on_player_id"

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

  create_table "player_stats", force: true do |t|
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_stats", ["player_id"], name: "index_player_stats_on_player_id"

  create_table "players", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "team_id"
    t.string   "pid",            limit: 8
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bats",           limit: 1
    t.string   "throws",         limit: 1
    t.integer  "height"
    t.integer  "weight"
    t.date     "birth_date"
    t.string   "position"
    t.boolean  "on_25",                    default: false
    t.boolean  "on_40",                    default: false
    t.boolean  "on_dl",                    default: false
    t.boolean  "on_bereavement",           default: false
    t.boolean  "on_paternity",             default: false
    t.boolean  "suspended",                default: false
    t.boolean  "retired",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dfa",                      default: false
    t.boolean  "restricted",               default: false
  end

  add_index "players", ["franchise_id"], name: "index_players_on_franchise_id"
  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "stat_definitions", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "raw"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbr",       limit: 6
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

  create_table "unavailable_players", force: true do |t|
    t.integer  "franchise_id"
    t.integer  "player_id"
    t.integer  "year"
    t.integer  "length"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unavailable_players", ["franchise_id"], name: "index_unavailable_players_on_franchise_id"
  add_index "unavailable_players", ["player_id"], name: "index_unavailable_players_on_player_id"

end
