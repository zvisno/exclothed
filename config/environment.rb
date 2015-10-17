# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if !Rails.env.production?
  require 'pry'
end

require 'carrierwave/orm/activerecord'
