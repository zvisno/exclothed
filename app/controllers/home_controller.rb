class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def new
    
  end
end
