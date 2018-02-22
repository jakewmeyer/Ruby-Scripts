#!/usr/bin/env ruby

# CLI app for currency conversion
# Uses Ruby Money for accuracy
# Uses Fixer.io for exchange data

require 'uri'
require 'net/http'
require 'json'
require 'money'
require 'monetize'


def conversion
  # User input
  begin
    base_currency = ARGV[0].upcase
    initial_amount = ARGV[1]
    convert_to = ARGV[2].upcase
  rescue
    puts 'Input Error'
    exit(1)
  end

  # Fetches API info
  begin
    uri = URI("http://api.fixer.io/latest?base=#{base_currency}&symbols=#{convert_to}")
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
    convert_factor = (parsed['rates'][convert_to])
  rescue
    puts
    puts 'No exchange rate found'
    puts
    exit(1)
  end

  # Fixes locale exception bug
  I18n.enforce_available_locales = false

  # Creates money exchange rate and new money object
  begin
    Money.add_rate(base_currency, convert_to, convert_factor)
  rescue Money::Currency::UnknownCurrency
    puts 'Invalid Currency'
    exit(1)
  end
  initial = Monetize.parse("#{base_currency} #{initial_amount}")
  final_convert = initial.exchange_to(convert_to)

  # Output formatting
  puts
  puts '================='
  puts "#{base_currency} to #{convert_to}"
  puts "Rate: #{convert_factor}"
  puts "#{base_currency}: #{initial.format}"
  puts "#{convert_to}: #{final_convert.format}"
  puts '================='
  puts
end

conversion
