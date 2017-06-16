#!/usr/bin/env ruby

# CLI app for currency conversion
# Uses BigDecimal for accuracy
# Uses Fixer.io as data source

require 'rest-client'
require 'json'
require 'bigdecimal'

def user_input
  print "Base - Ex.'USD' => "
  base_currency = gets.chomp
  print "Amount - Ex.'13.76' => "
  initial_amount = gets.chomp
  print "Convert to - Ex.'EUR'"
  convert = gets.chomp
end


def api_fetch

end


def conversion

end
