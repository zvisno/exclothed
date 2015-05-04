class Color < ActiveRecord::Base

  def get_color name
    Color.find_by name: name
  end

  def create_color name
    Color.create name: name
  end

end
