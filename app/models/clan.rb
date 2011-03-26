class Clan < ActiveRecord::Base
  has_many :players
  has_many :rounds_won, :class_name => "Round", :foreign_key => "winner_id"
  has_many :rounds_blue, :class_name => "Round", :foreign_key => "clan_blue_id"
  has_many :rounds_purple, :class_name => "Round", :foreign_key => "clan_purple_id"
  has_many :matches_won, :class_name => "Match", :foreign_key => "winner_id"
  has_many :scores
  has_many :matches, :through => :scores
  has_many :participations
  has_and_belongs_to_many :leagues
  has_and_belongs_to_many :tournaments


  def matches_lost
    matches.where("winner_id != ?", self.id)
  end

  def matches_drawn
    matches.played.where("winner_id is NULL")
  end

  def update_counts
    self.won_count = self.matches_won.count
    self.drawn_count = self.matches_drawn.count
    self.lost_count = self.matches_lost.count
    save
  end

end
