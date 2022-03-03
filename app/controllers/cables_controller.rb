class CablesController < ApplicationController
  def show
    @cable = Cable.find(params[:id])
  end
end
