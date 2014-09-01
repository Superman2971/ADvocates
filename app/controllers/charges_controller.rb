class ChargesController < ApplicationController
	def new
	end

	def create

		current_business.add_tweets(params[:money])
	  # Amount in cents
	  @amount = params[:money]

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
 
	  redirect_to business_path(current_business.id)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
	
end
