class Size < ActiveRecord::Base
  def get_size name
    Size.find_by name: name
  end

  def create_size name
    Size.create name: name
  end
end
