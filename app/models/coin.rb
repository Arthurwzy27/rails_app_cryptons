class Coin < ApplicationRecord
  has_many :entries

  def fetch_data
    if Date.today - self.created_at > 60000
      url = "https://api.coingecko.com/api/v3/coins/#{self.name}"
      coins_serialized = URI.open(url).read
      data = JSON.parse(coins_serialized)

      self.price = data["market_data"]["current_price"]["usd"]
      self.percentage_24 = data["market_data"]["price_change_percentage_24h"]
    end
  end
end
