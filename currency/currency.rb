#!/usr/bin/env ruby

# CLI app for currency conversion
# Uses Ruby Money for accuracy
# Uses Fixer.io for exchange data

require 'rest-client'
require 'json'
require 'bigdecimal'
require 'bigdecimal/util'
require 'currencies'

# User input
print "Base - Ex.'USD' => "
base_currency = gets.chomp.upcase
print "Amount - Ex.'13.76' => "
initial_amount = BigDecimal(gets.chomp)
print "Convert to - Ex.'EUR' => "
convert_to = gets.chomp.upcase

# Fetches API info
url = "http://api.fixer.io/latest?base=#{base_currency}&symbols=#{convert_to}"
response = RestClient.get(url)
parsed = JSON.parse(response)
convert_factor = (parsed['rates'][convert_to])


Money.add_rate("USD", "CAD", 1.24515)

# Output formatting
puts ''
puts '================='
puts "| #{base_currency} to #{convert_to}"
puts "| #{base_currency}: #{initial_symbol}#{initial_amount.to_s}"
puts "| #{convert_to}: #{final_symbol}#{final_convert.to_s}"
puts '================='
puts ''
