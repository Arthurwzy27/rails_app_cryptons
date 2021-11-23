class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @portfolio = Portfolio.find(params[:portfolio_id])
    @entry.portfolio = @portfolio
    if @entry.save
      redirect_to portfolio_path(portfolio)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
