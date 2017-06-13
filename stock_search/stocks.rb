#!/usr/bin/env ruby
# CLI app that searches stock info by symbol

require 'rest-client'
require 'json'

def stock_search
    print "Stock symbol => "
    symbol = gets.chomp.upcase

    url = "http://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=946DU3BV54DQIGIK"
    response = RestClient.get(url)
    parsed = JSON.parse(response)

    


    puts ""
    puts "======================|"
    puts "| Symbol: "
    puts "| Price: "
    puts "| Open: "
    puts "| High: "
    puts "| Price Chg: "
    puts "| Price Chg %: "
    puts "| Volume: "
    puts "|======================"
    puts ""

end

stock_search
