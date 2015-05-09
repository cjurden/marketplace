class TransactionsController < ApplicationController
	
  #Function to find roast by its slug and check if the sale is successful.
  def create
  	roast  = Roast.find_by!(slug: params[:slug])
	sale = roast.sales.create(
		amount: roast.price,
		buyer_email: current_user.email,
		seller_email: roast.user.email,
		stripe_token: params[:stripeToken])
	sale.process!
	if sale.finished?
		redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
	else
		redirect_to roast_path(roast), notice: "Something went wrong"
	end
  end
 
 #Function to obtain purchased roast
  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @roast = @sale.roast
  end
end
