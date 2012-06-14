require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => 'AKIAJ5CN6JNJ7WVYFJ7Q',
      :aws_secret_access_key => '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',
      :region => 'eu-west-1'
  }
  config.fog_directory = 'taskmgr397'
end