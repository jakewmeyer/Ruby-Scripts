#!/usr/bin/env ruby
# CLI app that searches stock info by symbol

require 'rest-client'
require 'json'

def stock_search
    # Cptures user inputs
    puts ""
    print "Stock => "
    symbol = gets.chomp

    # Takes user input and generates ticker symbol
    url = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{symbol}&region=1&lang=en%22"
    response = RestClient.get(url)
    parsed = JSON.parse(response)
    parsed_symbol = parsed["ResultSet"]["Result"][0]["symbol"]

    # Rest API to fetch current JSON data
    url = "http://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{parsed_symbol}&apikey=946DU3BV54DQIGIK"
    response = RestClient.get(url)
    parsed = JSON.parse(response)

    # Assigning variables to hash key values
    parsed_symbol = parsed["Realtime Global Securities Quote"]["01. Symbol"]
    parsed_price = parsed["Realtime Global Securities Quote"]["03. Latest Price"]
    parsed_open = parsed["Realtime Global Securities Quote"]["04. Open (Current Trading Day)"]
    parsed_high = parsed["Realtime Global Securities Quote"]["05. High (Current Trading Day)"]
    parsed_price_chg = parsed["Realtime Global Securities Quote"]["08. Price Change"]
    parsed_price_pct = parsed["Realtime Global Securities Quote"]["09. Price Change Percentage"]
    parsed_volume = parsed["Realtime Global Securities Quote"]["10. Volume (Current Trading Day)"]
    parsed_exchange = parsed["Realtime Global Securities Quote"]["02. Exchange Name"]

    # Output of parsed hash
    puts ""
    puts "======================"
    puts "| Symbol: #{parsed_symbol}"
    puts "| Price: $#{parsed_price}"
    puts "| Open: $#{parsed_open}"
    puts "| High: $#{parsed_high}"
    puts "| Price Chg: $#{parsed_price_chg}"
    puts "| Price Chg % : #{parsed_price_pct}"
    puts "| Volume: #{parsed_volume}"
    puts "| Echange: #{parsed_exchange}"
    puts "======================"
    puts ""
end

stock_search
