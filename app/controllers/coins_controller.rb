class CoinsController < ApplicationController
  def index
    @coins = Coin.all.order(:market_cap_rank)
  end

  def show
    @coin = Coin.find(params[:id])
    @coin.fetch_data
  end

  def get_follow
    @coin = Coin.find(params[:coin_id])
    current_user.favorite(@coin)
    redirect_to request.referrer
  end

  def get_unfollow
    @coin = Coin.find(params[:coin_id])
    current_user.unfavorite(@coin)
    redirect_to request.referrer
  end
end
