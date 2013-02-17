class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_username(params[:username].downcase)
		if user && user.authenticate(params[:password])
			sign_in user
			redirect_back_or_to user
		else
			flash.now[:error] = "Invalid username or password"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end