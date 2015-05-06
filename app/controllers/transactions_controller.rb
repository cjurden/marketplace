class TransactionsController < ApplicationController
  def create
  	roast  = Roast.find_by!(slug: params[:slug])
	sale = @roast.sales.create(
		amount: @roast.price,
		buyer_email: current_user.email,
		seller_email: @roast.user.email,
		stripe_token: params[:stripeToken])
	sale.process!
	if sale.finished?
		redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
	else
		redirect_to book_path(book), notice: "Something went wrong"
	end
  end
 
  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @roast = @sale.roast
  end
end
