#!/usr/bin/env ruby

# CLI app for currency conversion
# Uses BigDecimal for accuracy
# Uses Fixer.io as data source

require 'rest-client'
require 'json'
require 'bigdecimal'

def user_input(base_currency, initial_amount, convert)
  print "Base - Ex.'USD' => "
  base_currency = gets.chomp.upcase
  print "Amount - Ex.'13.76' => "
  initial_amount = BigDecimal.new(gets.chomp)
  print "Convert to - Ex.'EUR' => "
  convert = gets.chomp.upcase
end

def api_fetch(base_currency, convert, parsed)
  url = "http://api.fixer.io/latest?base=#{base_currency}&symbols=#{convert}"
  response = RestClient.get(url)
  parsed = JSON.parse(response)
end


def conversion

end

user_input
