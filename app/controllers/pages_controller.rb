require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @coins = Coin.all
  end

  def market
    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    coins_serialized = URI.open(url).read
    @coins = JSON.parse(coins_serialized)
  end
end
