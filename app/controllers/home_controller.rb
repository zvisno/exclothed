class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user_clothing = Clothing.get_user_items(current_user.id)
  end
end
