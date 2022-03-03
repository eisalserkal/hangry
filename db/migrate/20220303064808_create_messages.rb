class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :cable, null: false, foreign_key: true
      t.references :cover, null: false, foreign_key: true

      t.timestamps
    end
  end
end
