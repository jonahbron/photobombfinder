
CarrierWave.configure do |config|

  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_S3_KEY_ID'],
    aws_secret_access_key: ENV['AWS_S3_ACCESS_KEY'],
    region:                'us-west-2'
  }
  config.fog_directory  = ENV['AWS_S3_BUCKET']                             # required
  # config.s3_access_policy = :public_read
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_host = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

   Excon.ssl_verify_peer = false 

end
