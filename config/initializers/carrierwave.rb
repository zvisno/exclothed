# Handle cyrillic names of filenames

PictureUploader.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory = ENV['AWS_BUCKET']
  config.fog_public = false

  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"

    config.cache_dir = "#{Rails.root}/tmp/uploads"
  else
    config.storage = :fog
  end

end