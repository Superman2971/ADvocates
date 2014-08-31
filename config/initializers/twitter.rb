# $twitter = Twitter::REST::Client.new do |config|
#   config.consumer_key = ENV['oU3tGgRyVXax868iZ0U8TPNGT']
#   config.consumer_secret = ENV['4Od2ftvBA1fAkQxzD7HxKvZrdUUtdpVJxMcHCfip72ODsClYAO']
#   config.access_token = ENV['882604026-bveWbKXlKH3rncC3BsdkbHpZ6yuViKTjfhybPSU7']
#   config.access_token_secret = ENV['pBHDTTORofpkvk8gj7KqTxg9djS4tBPBPxCCW48Rlxrp8']
# end

Rails.configuration.twitter = {
  :twitter_key => ENV['TWITTER_KEY'],
  :twitter_secret => ENV['TWITTER_SECRET']
}


$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = Rails.configuration.twitter[:twitter_key]
  config.consumer_secret = Rails.configuration.twitter[:twitter_secret]
  config.access_token = '333193431-2zc04DyX1iyD20A9CyIgxYHQROaFUC1SHtSdGA6k'
  config.access_token_secret = 'mGCDhlXtvGxmESOe9UoqVS0LxKZIIuCGOdMR3zaMtNEJ3'
end