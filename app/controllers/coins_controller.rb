class CoinsController < ApplicationController
  def index
    @coins = Coin.all.order(:market_cap_rank)
  end

  def show
    @coin = Coin.find(params[:id])
    @coin.fetch_data
  end

end
