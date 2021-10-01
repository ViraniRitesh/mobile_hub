class GalleryController < ApplicationController
  def index
  	@mobiles = Product.all
  end

  def search
    keyword = "%" + params[:search].to_s + "%"
    @mobiles = Product.find_by_sql ["SELECT * FROM products WHERE name like ? OR brand like ? OR colour like ? OR ram like ? OR storage like ? OR os like ?",keyword,keyword,keyword,keyword,keyword,keyword]
  end

  def checkout
  	if request.post?
      
  		ActiveMerchant::Billing::Base.mode = :test
		  credit_card = ActiveMerchant::Billing::CreditCard.new(
  		:number     => params[:number],
  		:month      => params[:month],
  		:year       => params[:year],
  		:first_name => params[:first_name],
  		:last_name  => params[:last_name],
  		:verification_value  => params[:verification_number]
		  )
		  amount=session[:amount]
		  if credit_card.valid?
	  		gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
	    	:login    => 'TestMerchant',
	    	:password => 'password',
        :test =>'true'
	  		)
	  		response = gateway.authorize(amount, credit_card)
	  		if response.success?
          PostmanMailer.purchase_complete(current_user,amount,current_cart).deliver
    			gateway.capture(amount, response.authorization)
    			session[:cart_id]= nil
          redirect_to :action=>:success
  			else
    			raise StandardError, response.message
  			end
      else
        flash[:notice]="Invalid Card"
        render :action=>:checkout
		  end
	  end
  end
end
