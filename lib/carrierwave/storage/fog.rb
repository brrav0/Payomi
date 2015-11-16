CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        										# required
  config.fog_credentials = {
    provider:              'AWS',                        										# required
    aws_access_key_id:     'AKIAJUKRZIV4YECHMQ2Q',                        						# required
    aws_secret_access_key: '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',                        	# required
    region:                'eu-central-1',                  									# optional, defaults to 'us-east-1'
    #host:                  's3.amazonaws.com',             										# optional, defaults to nil
    #endpoint:              'https://app505.s3-website.eu-central-1.amazonaws.com' 				# optional, defaults to nil
  }
  config.fog_directory  = 'app505'                          									# required
  #config.fog_public     = false                                        							# optional, defaults to true
  #config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } 						# optional, defaults to {}
end