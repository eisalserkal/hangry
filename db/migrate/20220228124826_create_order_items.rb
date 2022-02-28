class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :food, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :status, default: 'Submitted'

      t.timestamps
    end
  end
end
