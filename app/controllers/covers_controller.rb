class CoversController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @cover = Cover.find(params[:id])
    @restaurant = @cover.restaurant
    @foods = @restaurant.foods
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
