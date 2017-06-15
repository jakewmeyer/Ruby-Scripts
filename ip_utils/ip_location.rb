#!/usr/bin/env ruby
#CLI app to locate your current public IP

require 'Rest-Client'
require 'json'

def ip_current_geo

  begin
    url = "http://ip-api.com/json"
    response = RestClient.get(url)
    info = JSON.parse(response)
  rescue
    puts ''
    puts 'No IP found.'
    puts ''
    exit(0)
  end

  ip = info["query"]
  city = info["city"]
  region = info["region"]
  country = info["country"]
  isp = info["isp"]
  org = info["org"]

  if city.nil?
    puts ''
    puts 'No IP found.'
    puts ''
    exit(0)
  else
    puts "IP: #{ip}"
    puts "City: #{city}"
    puts "Region: #{region}"
    puts "Country: #{country}"
    puts "ISP: #{isp}"
    puts "ORG: #{org}"
  end
end

ip_current_geo
