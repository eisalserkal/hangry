class CoversController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @covers = Cover.where(restaurant: params[:restaurant_id])
  end

  def show
    @cover = Cover.find(params[:id])
    @restaurant = @cover.restaurant
    @foods = @restaurant.foods
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.new(cover_params)
    @cover.restaurant = @restaurant
    if @cover.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.find(params[:id])
  end

  def update
    @cover = Cover.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover.update(cover_params)
    redirect_to dashboard_path

  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.find(params[:id])
    @cover.destroy
    redirect_to dashboard_path
  end

  private

  def cover_params
    params.require(:cover).permit(:table_number, :waiter_id)
  end
end
