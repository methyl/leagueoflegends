class League < ActiveRecord::Base
  has_many :matches
  has_and_belongs_to_many :clans
  belongs_to :game_type

end
