CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_ACCESS_SECRET_KEY'],                        # required
    :region                 => 'ap-northeast-1',                  # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = 'yfes-app-storage-dev' if Rails.env.development?                   # required
  config.fog_directory  = 'yfes-app-storage' if Rails.env.production?                   # required  
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_authenticated_url_expiration = 600
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end