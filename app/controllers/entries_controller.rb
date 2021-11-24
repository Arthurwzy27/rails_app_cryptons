class EntriesController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @entry = Entry.new
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
  end

  def update
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(:amount, :buying_price, :coin_id, :portfolio_id)
  end
end
