class AddCheckoutSessionIdToReceipts < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :checkout_session_id, :string
  end
end
