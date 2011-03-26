class MatchesController < ApplicationController
  def index
    @matches = Match.played.page(params[:page])

  end

  def show
    @match = Match.find(params[:id])
  end
end
