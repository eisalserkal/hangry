class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.boolean :is_paid

      t.timestamps
    end
  end
end
