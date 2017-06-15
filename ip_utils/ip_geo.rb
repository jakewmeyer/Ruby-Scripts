#!/usr/bin/env ruby
#CLI program to find IP geolocation

require 'rest-client'
require 'json'

def ip_location
  puts ''
  print 'IP => '
  ip = gets.chomp

  begin
    url = "http://ip-api.com/json/#{ip}"
    response = RestClient.get(url)
    info = JSON.parse(response)
  rescue
    puts ''
    puts 'IP not found.'
    puts ''
    exit(0)
  end

  ip = info['query']
  city = info['city']
  region = info['region']
  country = info['country']
  isp = info['isp']
  zip = info['zip']

  if city.nil?
    puts ''
    puts 'IP not found.'
    puts ''
    exit(0)
  else
    puts ''
    puts '============================='
    puts "| IP: #{ip}"
    puts "| City: #{city}"
    puts "| Region: #{region}"
    puts "| Country: #{country}"
    puts "| ZIP: #{zip}"
    puts "| ISP: #{isp}"
    puts '============================='
    puts ''
  end
end

ip_location
