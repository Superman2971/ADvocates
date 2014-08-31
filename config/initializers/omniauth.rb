Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, Rails.configuration.twitter[:twitter_key], Rails.configuration.twitter[:twitter_secret], {
  	:image_size => 'original'
  }
end