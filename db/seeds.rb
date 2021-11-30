require 'rest-client'

puts "Detroyng database..."

Entry.destroy_all
Coin.destroy_all
User.destroy_all
Portfolio.destroy_all

sleep 1
puts "Databse destroyed..."
sleep 1

puts "Fetching Info..."
url = RestClient.get 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'
url_array = JSON.parse(url)

sleep 1
puts "Creating Coins..."
puts ""
puts "------------------------------------------------------"
url_array.each do |coin|
  coin = Coin.create!(
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
  puts "Created #{coin.name}"
end

sleep 1
puts ""
puts "------------------------------------------------------"
puts ""
puts "Creating User..."
user_one = User.create!(email: "1@1.com", password: "123456")
sleep 1
puts "#{user_one.email} Created..."
sleep 1
puts ""
puts "------------------------------------------------------"
puts "#{Coin.all.count} Coins Created."
puts "#{User.all.count} Users Created."
puts "------------------------------------------------------"
