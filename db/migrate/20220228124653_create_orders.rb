class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :receipt, null: false, foreign_key: true
      t.references :cover, null: false, foreign_key: true

      t.timestamps
    end
  end
end
