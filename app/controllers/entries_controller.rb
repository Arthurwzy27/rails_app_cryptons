class EntriesController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @entry = Entry.new
    @coins = Coin.all.map { |coin| {
      "name": coin.name,
      "price": coin.price,
    }}
  end

  def create
    @entry = Entry.new(entry_params)
    @portfolio = Portfolio.find(params[:portfolio_id])
    @entry.portfolio = @portfolio
    if @entry.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to portfolio_path(@entry.portfolio)
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to portfolio_path(@entry.portfolio)
  end

  private

  def entry_params
    params.require(:entry).permit(:amount, :buying_price, :coin_id, :portfolio_id)
  end
end
