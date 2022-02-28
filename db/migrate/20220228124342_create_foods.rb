class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :category
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
