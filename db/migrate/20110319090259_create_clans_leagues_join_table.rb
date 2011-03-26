class CreateClansLeaguesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :clans_leagues, :id => false do |t|
      t.integer :clan_id
      t.integer :league_id
    end
  end

  def self.down
    drop_table :clans_leagues
  end
end