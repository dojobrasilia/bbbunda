require 'tweetstream'
require 'pp'
require 'mongo'

TweetStream.configure do |config|
  config.consumer_key = '8lRowQsSQ9Av78rYvlwzYw'
  config.consumer_secret = '2Lwqw1HjzOhn6Ucihd2vnODwmFC6XpMDVss7q1LKmc'
  config.oauth_token = '461415821-O8eJ8tZJAthceFhXrrKaQcQj6NJCJ3ybnLdve1gz'
  config.oauth_token_secret = 'NovrBRPmlGTrx4XK7r2z6hQXvkyDwPPIYyNRfYfS6kk'
  config.auth_method = :oauth
  config.parser   = :yajl
end

db = Mongo::Connection.new.db("bbbunda")
count = 0

TweetStream::Client.new.track('bbb') do |status|
  puts "#{count}. [#{status.user.screen_name}] #{status.text}"
  db['tweets'].insert(status)
  count += 1
end
