class Round < ActiveRecord::Base
  belongs_to :match
  has_and_belongs_to_many :banned_champions, :class_name => "Champion", :join_table => "banned_champions_rounds"
  belongs_to :clan_blue, :class_name => "Clan", :foreign_key => "clan_blue_id"
  belongs_to :clan_purple, :class_name => "Clan", :foreign_key => "clan_purple_id"
  belongs_to :winner, :class_name => "Clan", :foreign_key => "winner_id"

  scope :win

  after_save { |round| round.match.update_result}
  after_destroy { |round| round.match.update_result}


end
