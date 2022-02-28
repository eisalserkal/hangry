class CreateCovers < ActiveRecord::Migration[6.1]
  def change
    create_table :covers do |t|
      t.references :waiter, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
