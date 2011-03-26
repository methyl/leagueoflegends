class CreateClansTournamentsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :clans_tournaments, :id => false do |t|
      t.integer :clan_id
      t.integer :tournament_id
    end
  end

  def self.down
    drop_table :clans_tournaments
  end
end