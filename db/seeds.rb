# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'faker'
require 'clan'
require 'match'
require 'champion'
require 'league'

$clan_count = 10

def create_match(clan, result, league)
  if result == 'x' then round_count = 2 else round_count = 3 end
  clan_2 = Clan.first(:offset => rand($clan_count-1), :conditions => "id != #{clan.id}") # get single random clan
  match = league.matches.create(:clans => [clan,clan_2])
  rounds = []
  round_count.times do |n|
    clans = match.clans
    result=='x' ? winner = clans[n] : winner=clans[result-1]
    rounds << {:clan_blue => clans[0], :clan_purple => clans[1], :winner => winner}
  end
  match.rounds.create(rounds)
  clans = match.clans
  for c in clans
    participations = []
    for p in c.players.limit(league.game_type.max_players)
      rand_champion = Champion.first(:offset => rand(Champion.count))
      participations << {:player => p, :champion => rand_champion, :clan => c}
    end
    match.participations.create(participations)
  end
end

champions = [{:name=>"Akali"},
{:name=>"Alistar"},
{:name=>"Amumu"},
{:name=>"Anivia"},
{:name=>"Annie"},
{:name=>"Ashe"},
{:name=>"Blitzcrank"},
{:name=>"Caitlyn"},
{:name=>"Cassiopeia"},
{:name=>"Cho'Gath"},
{:name=>"Corki"},
{:name=>"Dr. Mundo"},
{:name=>"Evelynn"},
{:name=>"Ezreal"},
{:name=>"Fiddlesticks"},
{:name=>"Galio"},
{:name=>"Gangplank"},
{:name=>"Garen"},
{:name=>"Gragas"},
{:name=>"Heimerdinger"},
{:name=>"Irelia"},
{:name=>"Janna"},
{:name=>"Jarvan IV"},
{:name=>"Jax"},
{:name=>"Karma"},
{:name=>"Karthus"},
{:name=>"Kassadin"},
{:name=>"Katarina"},
{:name=>"Kayle"},
{:name=>"Kennen"},
{:name=>"Kog'Maw"},
{:name=>"LeBlanc"},
{:name=>"Lux"},
{:name=>"Malphite"},
{:name=>"Malzahar"},
{:name=>"Maokai"},
{:name=>"Master Yi"},
{:name=>"Miss Fortune"},
{:name=>"Mordekaiser"},
{:name=>"Morgana"},
{:name=>"Nasus"},
{:name=>"Nidalee"},
{:name=>"Nocturne"},
{:name=>"Nunu"},
{:name=>"Olaf"},
{:name=>"Pantheon"},
{:name=>"Poppy"},
{:name=>"Rammus"},
{:name=>"Renekton"},
{:name=>"Ryze"},
{:name=>"Shaco"},
{:name=>"Shen"},
{:name=>"Singed"},
{:name=>"Sion"},
{:name=>"Sona"},
{:name=>"Sivir"},
{:name=>"Soraka"},
{:name=>"Swain"},
{:name=>"Taric"},
{:name=>"Teemo"},
{:name=>"Tristana"},
{:name=>"Trundle"},
{:name=>"Tryndamere"},
{:name=>"Twisted Fate"},
{:name=>"Twitch"},
{:name=>"Udyr"},
{:name=>"Urgot"},
{:name=>"Veigar"},
{:name=>"Vladimir"},
{:name=>"Warwick"},
{:name=>"Xin Zhao"},
{:name=>"Zilean"}
]

game_types = [ {:name => "1vs1", :max_players => 1},{:name => "3vs3", :max_players => 3},{:name => "5vs5", :max_players => 5} ]

Champion.create(champions)
GameType.create(game_types)

$clan_count.times do |n| # create 10 clans and 6 players in it
  name = Faker::Company.name
  clan = Clan.create(:name=>name)
  6.times do |n|
    name = Faker::Internet.user_name
    clan.players.create(:name=>name)
  end
end


League.create(:name=>"League 1", :game_type => GameType.find(2))


League.all.each_with_index do |league,i|

  for clan in Clan.all do
    rand(3).times do # create wins
      create_match(clan, 1, league)
    end
    rand(3).times do # create looses
      create_match(clan, 2, league)
    end
    rand(3).times do # create draws
      create_match(clan, 'x', league)
    end

  end

end


