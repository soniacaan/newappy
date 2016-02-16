if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider         =>     'AWS',
      :s3_access_key_id =>     ENV['AKIAIRQOH37ZOLSGSXEA'],
      :s3_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['caansonia']
    
  end
end