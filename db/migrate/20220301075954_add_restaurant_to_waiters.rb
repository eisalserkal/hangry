class AddRestaurantToWaiters < ActiveRecord::Migration[6.1]
  def change
    add_reference :waiters, :restaurant, null: false, foreign_key: true
  end
end
