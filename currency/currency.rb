#!/usr/bin/env ruby

# CLI app for currency conversion
# Uses BigDecimal for accuracy
# Uses Fixer.io for data

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

# Finds proper currency symbols for output
currency_initial = ISO4217::Currency.from_code(base_currency)
initial_symbol = currency_initial.symbol
currency_final = ISO4217::Currency.from_code(convert_to)
final_symbol = currency_final.symbol

# Runs conversion logic
convert_factor = (parsed['rates'][convert_to]).to_d
final_convert = initial_amount * convert_factor


puts ''
puts '================='
puts "| #{base_currency} to #{convert_to}"
puts "| #{base_currency}: #{initial_symbol}#{initial_amount}"
puts "| #{convert_to}: #{final_symbol}#{final_convert}"
puts '================='
puts ''
