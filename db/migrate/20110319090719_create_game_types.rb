class CreateGameTypes < ActiveRecord::Migration
  def self.up
    create_table :game_types do |t|
      t.string :name
      t.integer :max_players

      t.timestamps
    end
  end

  def self.down
    drop_table :game_types
  end
end
