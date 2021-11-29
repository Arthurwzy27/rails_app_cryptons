class AddNewParamsToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :market_cap_rank, :integer
    add_column :coins, :market_cap, :bigint
    add_column :coins, :total_volume, :bigint
    add_column :coins, :high_24h, :integer
    add_column :coins, :low_24h, :integer
    add_column :coins, :total_supply, :bigint
    add_column :coins, :ath, :integer
    add_column :coins, :ath_change_percentage, :integer
  end
end
