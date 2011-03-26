class CreateClans < ActiveRecord::Migration
  def self.up
    create_table :clans do |t|
      t.string :name
      t.integer :won_count
      t.integer :lost_count
      t.integer :drawn_count

      t.timestamps
    end
  end

  def self.down
    drop_table :clans
  end
end
