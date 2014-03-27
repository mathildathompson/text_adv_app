CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', # required
    :aws_access_key_id      => ENV['AWS_KEY_ID'], # required
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
    #:region                 => 'us-west-1'
  }
 
  config.fog_directory  = 'textadventureimg' # required #The name of your bucket on Amazon SW3;
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end