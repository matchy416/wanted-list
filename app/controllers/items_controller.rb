class ItemsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:destroy]

	def new
		@item = current_user.items.build
	end

	def create
		@item = current_user.items.build(params[:item])
		if @item.save
			flash[:success] = "Item added"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_url
	end

	private

		def correct_user
			@item = current_user.items.find_by_id(params[:id])
			redirect_to root_url if @item.nil?
		end

end
