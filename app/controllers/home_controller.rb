class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @clothings = Clothing.new
    @user_items = @clothings.get_user_items(current_user.id)
  end
end
