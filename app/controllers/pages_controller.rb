require 'json'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def watchlist
    if current_user
      @favorites = current_user.all_favorited
    else
      redirect_to new_session_path
    end
  end
end
