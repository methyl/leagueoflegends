class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.references :clan_blue
      t.references :clan_purple
      t.references :winner
      t.references :match

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
