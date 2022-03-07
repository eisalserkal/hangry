class RestaurantChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    restaurant = Restaurant.find(params[:id])
    puts '#' * 20
    p restaurant
    stream_for restaurant
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
