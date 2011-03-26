class Champion < ActiveRecord::Base
  has_and_belongs_to_many  :rounds, :join_table => "banned_champions_rounds"
  has_many :participations

end