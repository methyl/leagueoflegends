class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :winner
      t.references :clan_1
      t.references :clan_2
      t.timestamp :played
      t.references :tournament
      t.references :league
      t.text :scores_hash

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
