class CoversController < ApplicationController

  def show
    @cover = Cover.find(params[:id])
  end

  def create
    @cover = Cover.new
    @cover.restaurant = current_user.restaurant.id
    if @cover.save
      redirect_to cover_path(@cover)
    else
      render :new
    end
  end

  def destroy
    @cover = Cover.find(params[:id])
    @cover.destroy
    redirect_to covers_path
  end

end
