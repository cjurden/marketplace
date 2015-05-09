class PagesController < ApplicationController
	#Authenticate user is signed in before showing dashboard
	before_action :authenticate_user!, only: [:dashboard]
	
  #Function to view roasts index	
  def home
  	if current_user
  		redirect_to roasts_path
  	end
  	@roasts = Roast.where(available: true).last(4)
  end

  #Function to view dashboard
  def dashboard
  	@roasts = current_user.roasts
  	@purchased = Sale.where(buyer_email: current_user.email)
  	@sales = Sale.where(seller_email: current_user.email)
  end
end
