class ChangeCoinSchema < ActiveRecord::Migration[6.1]
  def change
    remove_column :coins, :price
    add_column :coins, :price, :float
  end
end
