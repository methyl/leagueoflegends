class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.references :clan
      t.references :match
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
