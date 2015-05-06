class PagesController < ApplicationController
  def home
  	if current_user
  		redirect_to roasts_path
  end
end
