class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where(user_id: current_user)
  end

  def dashboard
    @restaurants = Restaurant.where(user_id: current_user)
    @covers = Cover.where(restaurant: @restaurants)
    @waiters = Waiter.where(restaurant: @restaurants)
    @foods = Food.where(restaurant: @restaurants)
    @requests = Request.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @cover = Cover.find(params[:cover_id])
    @foods = @restaurant.foods
    @categories = []
    @foods.each do |food|
      @categories << food.category
    end
    @categories.uniq!
    @categories_sorted = []
    @categories.each do |category|
      if category.downcase == 'starter'
        @categories_sorted << category
      end
    end
    @categories.each do |category|
      if category.downcase != 'starter'
        @categories_sorted << category
      end
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :photo)
  end
end
