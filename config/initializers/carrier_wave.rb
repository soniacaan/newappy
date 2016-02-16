if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider         =>     'AWS',
      :s3_access_key_id =>     ENV['S3_ACCESS_KEY'],
      :s3_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_Bucket']
    
  end
end