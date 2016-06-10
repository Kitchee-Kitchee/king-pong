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

ActiveRecord::Schema.define(version: 20160610054710) do

  create_table "king_pong_games", force: :cascade do |t|
    t.binary   "details"
    t.integer  "winner_id"
    t.string   "winner_type"
    t.integer  "loser_id"
    t.string   "loser_type"
    t.integer  "winner_score"
    t.integer  "loser_score"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
  end

  add_index "king_pong_games", ["loser_type", "loser_id"], name: "index_king_pong_games_on_loser_type_and_loser_id"
  add_index "king_pong_games", ["winner_type", "winner_id"], name: "index_king_pong_games_on_winner_type_and_winner_id"

  create_table "king_pong_history_events", force: :cascade do |t|
    t.integer  "value"
    t.integer  "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "king_pong_ratings", force: :cascade do |t|
    t.integer  "value",                         null: false
    t.boolean  "pro",           default: false
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "king_pong_tournaments", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "description"
    t.integer  "rater_algorithm", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "king_pong_users", force: :cascade do |t|
    t.string   "user_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "king_pong_users", ["email"], name: "index_king_pong_users_on_email", unique: true
  add_index "king_pong_users", ["user_name"], name: "index_king_pong_users_on_user_name", unique: true

end
