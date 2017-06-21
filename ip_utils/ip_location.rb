#!/usr/bin/env ruby
# Returns geolocation data for current IP

require 'rest-client'
require 'json'

def ip_current_geo
  begin
    url = "http://ip-api.com/json"
    response = RestClient.get(url)
    info = JSON.parse(response)
  rescue
    puts
    puts 'No IP found.'
    puts
    exit(1)
  end

  ip = info["query"]
  city = info["city"]
  region = info["region"]
  country = info["country"]
  isp = info["isp"]
  zip = info['zip']

  if city.nil?
    puts
    puts 'No IP found.'
    puts
    exit(1)
  else
    puts
    puts '============================='
    puts "| IP: #{ip}"
    puts "| City: #{city}"
    puts "| Region: #{region}"
    puts "| Country: #{country}"
    puts "| ZIP: #{zip}"
    puts "| ISP: #{isp}"
    puts '============================='
    puts
  end
end

ip_current_geo
