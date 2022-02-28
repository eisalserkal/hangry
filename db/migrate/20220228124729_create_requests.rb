class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.text :content
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
