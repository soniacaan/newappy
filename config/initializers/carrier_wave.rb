if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIRQOH37ZOLSGSXEA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    S3_BUCKET = ENV['caansonia']
  end
end