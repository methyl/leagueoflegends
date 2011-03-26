class ClansController < ApplicationController
  def show
    @clan = Clan.find(params[:id])
    @matches = @clan.matches.played.includes(:clans)
  end

  def index
  end

end
