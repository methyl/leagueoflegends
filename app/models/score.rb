class Score < ActiveRecord::Base
  belongs_to :clan
  belongs_to :match

  scope :by_clan, lambda { |clan| where("clan_id = ?",clan.id)}


end
