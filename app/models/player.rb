class Player < ActiveRecord::Base
  belongs_to :clan
  has_many :participations
  has_many :matches, :through => :participations
  has_many :champions, :through => :participations

  def matches_won
    self.matches.where("winner_id = ?",self.clan_id)
    end
  def matches_lost
    self.matches.where("looser_id = ?",self.clan_id)
    end
  def matches_drawn
    self.matches.where("draw_1_id = ? OR draw_2_id = ?",self.clan_id,self.clan_id)
  end
end
