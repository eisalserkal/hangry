class WaitersController < ApplicationController
  def index
    @waiters = Waiter.where(user: current_user)
  end

  def show
    @waiter = Waiter.find(params[:id])
  end

  def new
    @waiter = Waiter.new
  end

  def create
    @waiter = Waiter.new(waiter_params)
    @waiter.restaurant = current_user.restaurant.id
    if @waiter.save
      redirect_to waiter_path(@waiter)
    else
      render :new
    end
  end

  def edit
    @waiter = Waiter.find(params[:id])
  end

  def update
    @waiter = Waiter.find(params[:id])
    @waiter.update(waiter_params)
    redirect_to waiter_path(@waiter)
  end

  def destroy
    @waiter = Waiter.find(params[:id])
    @waiter.destroy
    redirect_to waiters_path
  end

  private

  def waiter_params
    params.require(:waiter).permit(:name)
  end
end
