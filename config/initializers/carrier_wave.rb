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
      :aws_region => ENV['S3_Region']
      
      
    }
    
   
    config.cache_dir = "#{Rails.root}/tmp/uploads" 
    config.fog_directory     =  ENV['S3_Bucket']
    config.fog_public = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} 

    



    
  end
end