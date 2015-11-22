
CarrierWave.configure do |config|
  # config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  config.base_path = ''

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_S3_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_S3_ACCESS_KEY']
  }
  config.fog_directory  = 'photobombfinder'                             # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
