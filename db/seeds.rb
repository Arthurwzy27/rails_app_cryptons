# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Entry.destroy_all
Coin.destroy_all

# Coin.create!(name: "Bitcoin", symbol: "btc", price: 66000)

User.destroy_all
Portfolio.destroy_all

user_one = User.create!(email: "1@1.com", password: "123456")


# Create seed from Coingecko API for new entry

require 'rest-client'

url = RestClient.get 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'
url_array = JSON.parse(url)

url_array.each do |coin|
  Coin.create!(
    name: coin["name"],
    symbol: coin["symbol"],
    image_url: coin["image"],
    price: coin["current_price"],
    percentage_24: coin["price_change_percentage_24h"],
    market_cap_rank: coin["market_cap_rank"],
    market_cap: coin["market_cap"],
    total_volume: coin["total_volume"],
    high_24h: coin["high_24h"],
    low_24h: coin["low_24h"],
    total_supply: coin["total_supply"],
    ath: coin["ath"],
    ath_change_percentage: coin["ath_change_percentage"]
  )
end
