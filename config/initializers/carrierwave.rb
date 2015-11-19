require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  #config.fog_provider = 'fog'
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAJUKRZIV4YECHMQ2Q',
    :aws_secret_access_key => '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',
    :region                => 'eu-central-1'
  }


  config.fog_directory    = 'app505'
  #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #config.fog_host         = 'https://s3.eu-central-1.amazonaws.com/app505'
end