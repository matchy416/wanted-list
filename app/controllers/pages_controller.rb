class PagesController < ApplicationController
  def home
  	@items = current_user.items.paginate(page: params[:page]) if signed_in?
  end
end
