#!/usr/bin/env ruby
# CLI app that searches stock info by symbol.

require 'json'
require 'uri'
require 'net/http'
require 'colorize'
require 'iex-ruby-client'

def stock_search
  symbol = ARGV.join(" ")
  token = ENV["IEX_API_TOKEN"]

  if token.nil?
    puts "Please export your IEX Cloud publishable API Token"
    puts "See: https://iexcloud.io/docs/api/#authentication"
    puts "export IEX_API_TOKEN='foo'"
    exit(1)
  end

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

  client = IEX::Api::Client.new(
  publishable_token: "#{token}",
  )

  quote = client.quote("#{parsed_symbol}")

  # Shorten exchange string
  case quote['primary_exchange']
    when "Nasdaq Global Select"
      exchange = "NASDAQ"
    when "New York Stock Exchange"
      exchange = "NYSE"
  end
  
  puts "=========================="
  puts "Symbol: #{quote['symbol']}"
  puts "Price: $#{quote['latest_price']}"

  # Color output for price change
  if quote['change'].positive?
    puts "Chg: " + "+#{quote['change']}".green
  else
    puts "Chg: " + "#{quote['change']}".red
  end

  # Color output for percent price change
  if quote['change_percent'].positive?
    puts "Chg %: " + "+#{quote['change_percent']}%".green
  else
    puts "Chg %: " + "#{quote['change_percent']}%".red
  end

  puts "PE Ratio: #{quote['pe_ratio']}"
  puts "Mkt Cap: $#{quote['market_cap']}"
  puts "Exchange: #{exchange}"
  puts "=========================="
end

stock_search
