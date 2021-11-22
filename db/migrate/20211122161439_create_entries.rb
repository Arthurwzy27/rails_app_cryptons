class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :amount
      t.integer :buying_price
      t.references :coin, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
