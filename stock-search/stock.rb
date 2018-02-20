#!/usr/bin/env ruby
# CLI app that searches stock info by symbol.

require 'json'
require 'uri'
require 'net/http'
require 'colorize'

def stock_search

  symbol = ARGV.join(" ")

  # Takes user input and generates ticker symbol.
  uri = URI("http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{symbol}&lang=en%22")
  response = Net::HTTP.get(uri)
  parsed = JSON.parse(response)
  parsed_symbol = parsed['ResultSet']['Result'][0]['symbol']
  puts parsed_symbol

  # Rest API to fetch current JSON data.
  uri = URI("https://api.iextrading.com/1.0/stock/#{parsed_symbol}/quote")
  response = Net::HTTP.get(uri)
  parsed = JSON.parse(response)

  change = parsed['change']
  if change.positive?
    puts "Change: " + "+#{change}%".green
  else
    puts "Change: " + "#{change}%".red
  end
end

stock_search
