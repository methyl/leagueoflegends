class CreateBannedChampionsRoundsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :banned_champions_rounds, :id => false do |t|
      t.integer :champion_id
      t.integer :round_id
    end
  end

  def self.down
    drop_table :banned_champions_rounds
  end
end