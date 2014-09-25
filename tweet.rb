#!/usr/bin/env ruby
require './twitter_client.rb'
require './conf.rb'

client = TwitterClient.new(@consumer_key, @consumer_secret,
                           @access_token, @access_token_secret)

status = ARGV.join(' ')
client.update(status)
