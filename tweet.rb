#!/usr/bin/env ruby
require 'oauth'

class TwitterClient
  @@CONSUMER_KEY = 'xxxx'
  @@CONSUMER_SECRET = 'xxxx'
  @@ACCESS_TOKEN = 'xxxx'
  @@ACCESS_TOKEN_SECRET = 'xxxx'
  
  @@URI = 'https://api.twitter.com/1.1/statuses/update.json'

  def self.update status
    consumer = OAuth::Consumer.new(@@CONSUMER_KEY,
                                   @@CONSUMER_SECRET,
                                   :site => 'http://twitter.com')
    
    access_token = OAuth::AccessToken.new(consumer,
                                          @@ACCESS_TOKEN,
                                          @@ACCESS_TOKEN_SECRET)

    request_api_uri = @@URI + '?status=' + URI.escape(status)

    response = access_token.post(request_api_uri)
    
    puts response.body
  end

end

if __FILE__ == $0
  status = ARGV.join(' ')

  TwitterClient.update status
end
