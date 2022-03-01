class CoversController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @covers = Cover.where(restaurant: params[:restaurant_id])
  end

  def show
    @cover = Cover.find(params[:id])
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
      redirect_to restaurant_cover_path(@restaurant, @cover)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover.update(cover_params)
    redirect_to restaurant_cover_path(@restaurant, @cover)

  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cover = Cover.find(params[:id])
    @cover.destroy
    redirect_to restaurant_covers_path(@restaurant)
  end

  private

  def cover_params
    params.require(:cover).permit(:table_number, :waiter_id)
  end
end
