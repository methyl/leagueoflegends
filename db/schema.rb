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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110321110019) do

  create_table "banned_champions_rounds", :id => false, :force => true do |t|
    t.integer "champion_id"
    t.integer "round_id"
  end

  create_table "champions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clans", :force => true do |t|
    t.string   "name"
    t.integer  "won_count"
    t.integer  "lost_count"
    t.integer  "drawn_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clans_leagues", :id => false, :force => true do |t|
    t.integer "clan_id"
    t.integer "league_id"
  end

  create_table "clans_tournaments", :id => false, :force => true do |t|
    t.integer "clan_id"
    t.integer "tournament_id"
  end

  create_table "game_types", :force => true do |t|
    t.string   "name"
    t.integer  "max_players"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.integer  "game_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "winner_id"
    t.integer  "clan_1_id"
    t.integer  "clan_2_id"
    t.datetime "played"
    t.integer  "tournament_id"
    t.integer  "league_id"
    t.text     "scores_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", :force => true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "champion_id"
    t.integer  "clan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "clan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "clan_blue_id"
    t.integer  "clan_purple_id"
    t.integer  "winner_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "clan_id"
    t.integer  "match_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", :force => true do |t|
    t.integer  "game_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
