class CreateWaiters < ActiveRecord::Migration[6.1]
  def change
    create_table :waiters do |t|
      t.string :name

      t.timestamps
    end
  end
end
