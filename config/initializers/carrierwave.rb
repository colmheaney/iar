CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJGFVLYDNVDNBLSWA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'eu-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'iar-test'                     # required
end