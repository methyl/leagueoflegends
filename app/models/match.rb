class Match < ActiveRecord::Base
  has_many :rounds
  has_many :participations
  has_many :players, :through => :participations
  has_many :scores
  has_many :clans, :through => :scores
  belongs_to :clan_1, :class_name => "Clan", :foreign_key => "clan_1_id"
  belongs_to :clan_2, :class_name => "Clan", :foreign_key => "clan_2_id"
  belongs_to :winner, :class_name => "Clan", :foreign_key => "winner_id"
  belongs_to :league
  belongs_to :tournament

  serialize :scores_hash


  scope :by_league, lambda { |league| where("league_id == ?",league.id) }
  scope :by_tournament, lambda { |tournament| where("tournament_id == ?",tournament.id) }
  scope :played, where("played is not NULL")
  scope :not_played, where("played is NULL")

  def score(clan)
    scores_hash[clan.id]
  end


  def result_string(clan)
    if self.played
      return "draw" if self.winner_id == nil
      return "win" if self.winner == clan
      return "lost" if self.winner != clan
    end
  end

  def update_result
    if rounds.count > 0
      self.scores_hash = {}
      scores = []
      for clan in self.clans
        score = self.scores.by_clan(clan).first
        score.score = rounds.where("winner_id = ?", clan.id).count
        scores << score.score
        score.save
        self.scores_hash[clan.id] = score.score
      end
      if scores[0] > scores[1]
        self.winner = self.clans[0]
      elsif scores[1] > scores[0]
        self.winner = self.clans[1]
      else
        self.winner = nil
      end

      self.played = Time.now
      for clan in clans
        clan.update_counts

      end

      self.save
    end


  end


end