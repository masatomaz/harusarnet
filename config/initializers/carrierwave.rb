require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.s3_access_key,
      aws_secret_access_key: Rails.application.secrets.s3_secret_key,
      region: Rails.application.secrets.s3_region
    }
  
    config.fog_directory  = Rails.application.secrets.s3_bucket
  end
end