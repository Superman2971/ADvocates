Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, "HVnDjU3wFwHrfZoEYhkupIXma", "gc2xxabstcEJvxU48cCFqJOUYs7uGbm1m0syiUtvYxZLvA3WJk", {
  	:image_size => 'original'
  }
end