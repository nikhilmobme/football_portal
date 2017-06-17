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

ActiveRecord::Schema.define(version: 20170617083006) do

  create_table "contracts", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_contracts_on_player_id"
    t.index ["team_id"], name: "index_contracts_on_team_id"
  end

  create_table "lineups", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "team_id"
    t.string   "position"
    t.boolean  "is_caption"
    t.boolean  "is_keeper"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_lineups_on_match_id"
    t.index ["player_id"], name: "index_lineups_on_player_id"
    t.index ["team_id"], name: "index_lineups_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string   "venue"
    t.datetime "date"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
