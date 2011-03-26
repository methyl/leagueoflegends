class ClansController < ApplicationController
  def show
    @clan = Clan.find(params[:id])
    @matches = @clan.matches
  end

  def index
  end

end
