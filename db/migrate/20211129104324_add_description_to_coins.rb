class AddDescriptionToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :description, :text
  end
end
