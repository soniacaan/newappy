if Rails.env.production?
  CarrierWave.configure do |config|
     config.cache_dir = "#{Rails.root}/tmp/"
      config.storage = :fog
      config.permissions = 0666

    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider         =>     'AWS',
      :aws_access_key_id =>     ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region => ENV['S3_Region'],
      :endpoint => 'https://caansonia.s3-website-us-west-2.amazonaws.com',
      :path_style => true
      
    }
    config.fog_directory     =  ENV['S3_Bucket']
    config.fog_public    = true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} 
    config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku



    
  end
end