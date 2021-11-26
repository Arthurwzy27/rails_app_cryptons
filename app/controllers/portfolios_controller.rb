class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @portfolio.entries.each do |entry|
      entry.coin.fetch_data
      entry.coin.fetch_history
    end

  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to portfolios_path
    else
      render :new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    # @portfolio.user = current_user
    @portfolio.destroy
    if current_user.portfolios.empty?
      redirect_to root_path
    else
      redirect_to portfolios_path
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id)
  end
end
