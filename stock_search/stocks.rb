#!/usr/bin/env ruby
# CLI app that searches stock info by symbol

require 'rest-client'
require 'json'

def stock_search
    print "Stock symbol => "
    symbol = gets.chomp

    url = "http://ipinfo.io/#{ip}/json"
    response = RestClient.get(url)
    stock_info = JSON.parse(response)

end
