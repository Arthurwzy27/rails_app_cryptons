class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
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

  end

  def update
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    # @portfolio.user = current_user
    if @portfolio.destroy
      redirect_to portfolios_path
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id)
  end
end