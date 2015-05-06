class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  	if current_user
  		redirect_to roasts_path
  	end
  end

  def dashboard
  	@roasts = current_user.roasts
  end
end
