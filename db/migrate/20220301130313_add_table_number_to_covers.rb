class AddTableNumberToCovers < ActiveRecord::Migration[6.1]
  def change
    add_column :covers, :table_number, :integer
  end
end
