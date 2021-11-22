class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.integer :price
      t.string :image_url
      t.string :percentage_24
      t.string :history_seven

      t.timestamps
    end
  end
end
