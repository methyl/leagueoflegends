class Participation < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  belongs_to :champion
  belongs_to :clan

  scope :by_clan, lambda { |clan| where("clan_id = ?",clan.id) }

end
