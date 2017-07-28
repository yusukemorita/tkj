require 'twitter'
namespace :bot do
  client = Twitter::REST::Client.new(
    consumer_key: ENV['TWITTER_CONSUMER_KEY'],
    consumer_secret: ENV['TWITTER_CONSUMER_SECRET'],
    access_token: ENV['TWITTER_ACCESS_TOKEN'],
    access_token_secret: ENV['TWITTER_ACCESS_TOKEN_SECRET'],
   )
  task :tweet => :environment do
    client.update('目黒中小企業センター　https://takkyuumap.com/places/1')
  end
end
