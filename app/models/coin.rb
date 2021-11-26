require 'open-uri'
require 'json'

class Coin < ApplicationRecord
  has_many :entries

  def fetch_data
    if 5.minutes.ago - self.updated_at.time > 300
      url = "https://api.coingecko.com/api/v3/coins/#{self.name.downcase.delete(" ")}"
      coins_serialized = URI.open(url).read
      data = JSON.parse(coins_serialized)

      self.price = data["market_data"]["current_price"]["usd"]
      self.percentage_24 = data["market_data"]["price_change_percentage_24h"]
    end
  end
end
