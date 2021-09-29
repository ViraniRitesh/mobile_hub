class AdminController < ApplicationController
  def login
		if request.post?
			if params[:user]=="ritesh@" && params[:password]=="virani123"
				session[:admin]="admin"
				flash[:notice]="Welcome Ritesh"
				redirect_to products_path
			else
				flash[:notice]="Invalid Credentials"
				redirect_to :action=>:login
			end	
  		end	
 	end

 	def logout
 		session[:admin]=nil
 		flash[:notice]="You are logged out"
 		redirect_to :action=>:login
 	end	
end
