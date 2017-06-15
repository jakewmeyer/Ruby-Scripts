#!/usr/bin/env ruby
#CLI program to find IP geolocation

require 'json'
require 'rest-client'

def ip_location
  puts ''
  print 'IP => '
  ip = gets.chomp

  begin
    url = "http://ipinfo.io/#{ip}/json"
    response = RestClient.get(url)
    info = JSON.parse(response)
  rescue
    puts ''
    puts 'IP not found.'
    puts ''
    exit(0)
  end

  city = info['city']
  region = info['region']
  country = info['country']
  hostname = info['hostname']


  puts ''
  puts "City: #{city}"
  puts "Region: #{region}"
  puts "Country: #{country}"
  puts "Host: #{hostname}"
  puts ''
end

ip_location
