require 'open-uri'
require 'json'

class Coin < ApplicationRecord
  has_many :entries

  def fetch_data
    if 1.second.ago - self.updated_at > 120
      url = "https://api.coingecko.com/api/v3/coins/#{self.name.downcase.delete(" ")}"
      coins_serialized = URI.open(url).read
      data = JSON.parse(coins_serialized)

      self.price = data["market_data"]["current_price"]["usd"]
      self.percentage_24 = data["market_data"]["price_change_percentage_24h"]
      self.save
    end
  end

  def fetch_history
    # raise
    if 1.second.ago - self.updated_at > 120 || self.history_seven.nil?
      url = "https://api.coingecko.com/api/v3/coins/#{self.name.downcase}/market_chart?vs_currency=usd&days=7&interval=daily"
      coins = URI.open(url).read
      # raise
      data = JSON.parse(coins)["prices"].map {|coin| coin[1]}
      self.history_seven = data.to_json
      self.save
    end
  end
end
