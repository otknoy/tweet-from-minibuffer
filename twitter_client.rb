#!/usr/bin/env ruby
require 'oauth'

class TwitterClient
  @@URI = 'https://api.twitter.com/1.1/statuses/update.json'

  def initialize(consumer_key, consumer_secret, access_token, access_token_secret)
    @consumer_key        = consumer_key
    @consumer_secret     = consumer_secret
    @access_token        = access_token
    @access_token_secret = access_token_secret
  end

  def update status
    consumer = OAuth::Consumer.new(@consumer_key,
                                   @consumer_secret,
                                   :site => 'http://twitter.com')
    
    access_token = OAuth::AccessToken.new(consumer,
                                          @access_token,
                                          @access_token_secret)

    request_api_uri = @@URI + '?status=' + URI.escape(status)

    response = access_token.post(request_api_uri)
    
    puts response.body
  end

end

if __FILE__ == $0
  consumer_key        = ''
  consumer_secret     = ''
  access_token        = ''
  access_token_secret = ''

  client = TwitterClient.new(consumer_key, consumer_secret,
                             access_token, access_token_secret)

  status = ARGV.join(' ')
  client.update(status)
end
