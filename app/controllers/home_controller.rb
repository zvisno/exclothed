class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def new
    
  end

  def show
    Clothing.where(owner_id: current_user.id).take!
  end
end
