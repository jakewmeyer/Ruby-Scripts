#!/usr/bin/env ruby
#CLI app to locate your current public IP

require 'Rest-Client'
require 'json'

def ip_geo
  url = "http://ip-api.com/json"
  response = RestClient.get(url)
  info = JSON.parse(response)

  ip = info["query"]
  city = info["city"]
  region = info["region"]
  country = info["country"]
  isp = info["isp"]
  org = info["org"]

  puts "IP: #{ip}"
  puts "City: #{city}"
  puts "Region: #{region}"
  puts "Country: #{country}"
  puts "ISP: #{isp}"
  puts "ORG: #{org}"
end

ip_geo()
