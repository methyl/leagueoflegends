class MatchesController < ApplicationController
  def index
    @matches = Match.played.includes(:clans).page(params[:page])

  end

  def show
    @match = Match.includes(:clans).find(params[:id])
    @participations = {}
    @match.clans.each do |clan|
      @participations[clan.id] = @match.participations.includes(:player,:champion).where(:clan_id=>clan.id)
    end

  end
end
