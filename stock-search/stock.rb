#!/usr/bin/env ruby
# CLI app that searches stock info by symbol.

require 'json'
require 'uri'
require 'net/http'
require 'colorize'

def stock_search

  symbol = ARGV.join(" ")

  # Takes user input and generates ticker symbol.
  begin
    uri = URI("http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{symbol}&lang=en%22")
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    parsed_symbol = parsed['ResultSet']['Result'][0]['symbol'].split(".")[0]
  rescue
    puts "Stock not found"
    exit(1)
  end

  # Use ticker symbol to fetch quote data
  uri = URI("https://api.iextrading.com/1.0/stock/#{parsed_symbol}/quote")
  response = Net::HTTP.get(uri)
  if response == "Unknown symbol"
    puts "Stock not found"
    exit(1)
  end
  quote = JSON.parse(response)

  # Shorten exchange string
  case quote['primaryExchange']
    when "Nasdaq Global Select"
      exchange = "NASDAQ"
    when "New York Stock Exchange"
      exchange = "NYSE"
  end
  
  puts "=========================="
  puts "Symbol: #{quote['symbol']}"
  puts "Price: $#{quote['latestPrice']}"

  # Color output for price change
  if quote['change'].positive?
    puts "Chg: " + "+#{quote['change']}".green
  else
    puts "Chg: " + "#{quote['change']}".red
  end

  # Color output for percent price change
  if quote['changePercent'].positive?
    puts "Chg %: " + "+#{quote['changePercent']}%".green
  else
    puts "Chg %: " + "#{quote['changePercent']}%".red
  end

  puts "PE Ratio: #{quote['peRatio']}"
  puts "Mkt Cap: $#{quote['marketCap']}"
  puts "Exchange: #{exchange}"
  puts "=========================="
end

stock_search
