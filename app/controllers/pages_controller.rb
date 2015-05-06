class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  	if current_user
  		redirect_to roasts_path
  	end
  	@roasts = Roast.last(4)
  end

  def dashboard
  	@roasts = current_user.roasts
  	@purchased = Sale.where(buyer_email: current_user.email)
  	@sales = Sale.where(seller_email: current_user.email)
  end
end
