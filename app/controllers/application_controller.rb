class ApplicationController < ActionController::Base
	

	def after_sign_in_path_for(user)
		gallery_index_path
	end

	def after_sign_out_path_for(scope)
		gallery_index_path
	end

	def current_cart
		begin
			Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart=Cart.create
			session[:cart_id]=cart.id
			cart
		end
	end
end
