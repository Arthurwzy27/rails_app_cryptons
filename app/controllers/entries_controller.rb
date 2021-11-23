class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    authorize @entry
  end

  def create
    # @entry = Entry.new(entry_params)
    # @entry.user = current_user
    # if @entry.save
    #   redirect_to entry_path(@entry)
    # else
    #   render :new
    # end
    # authorize @entry
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
