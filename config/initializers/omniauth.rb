OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "oU3tGgRyVXax868iZ0U8TPNGT", "4Od2ftvBA1fAkQxzD7HxKvZrdUUtdpVJxMcHCfip72ODsClYAO"
end