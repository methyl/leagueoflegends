module ApplicationHelper

  def clan_span(match, clan)
    capture_haml do
        haml_tag :span, :class => (match.result_string(clan) == 'win' && !defined?(@clan)) && "bold", :title => "Wins: #{clan.won_count}, draws: #{clan.drawn_count}, loses: #{clan.lost_count}" do
          if clan == match.clans[0]
            haml_concat link_to clan.name, clan
          else
            haml_concat link_to clan.name, clan
          end
      end
    end
  end

end
