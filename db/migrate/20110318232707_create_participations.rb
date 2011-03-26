class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.references :match
      t.references :player
      t.references :champion
      t.references :clan

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
