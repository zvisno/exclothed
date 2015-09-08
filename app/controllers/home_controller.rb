class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @other_users_clothes = Clothing.get_other_users_clothes(current_user.id)
  end

end
