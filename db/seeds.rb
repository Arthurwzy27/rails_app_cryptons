# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.destroy_all

# Coin.create!(name: "Bitcoin", symbol: "btc", price: 66000)

User.destroy_all
Portfolio.destroy_all

user_one = User.create!(email: "1@1.com", password: "123456")
user_two = User.create!(email: "user@example.com", password: "password")

Portfolio.create!(
  name: "Portfolio test for 1@1",
  user: user_one
)
Portfolio.create!(
  name: "Portfolio test user@example",
  user: user_two
)

# Create seed from Coingecko API for new entry

require 'rest-client'

url = RestClient.get 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'
url_array = JSON.parse(url)

url_array.each do |coin|
  Coin.create(
    name: coin["name"],
    symbol: coin["symbol"],
    image_url: coin["image"],
    price: coin["current_price"],
    percentage_24: coin["price_change_percentage_24h"],
  )
end

