#!/usr/bin/env ruby
#CLI program to find IP geolocation

require 'rest-client'
require 'json'
require 'optparse'


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-m", "--machine VARIABLE", "Machine Readable") do |v|
    options[:var] = v
  end
end.parse!

# Ex. ip
opt = options[:var]

# Ex. 8.8.8.8
*arg = ARGV

if opt == nil && arg == nil
  puts
  print 'IP => '
  ip = gets.chomp

  url = "http://ip-api.com/json/#{ip}"
  response = RestClient.get(url)
  info = JSON.parse(response)

  if info['status'] == 'fail'
    puts 'No IP found'
  else
    puts
    puts '============================='
    puts "| IP: #{info['query']}"
    puts "| City: #{info['city']}"
    puts "| Region: #{info['region']}"
    puts "| Country: #{info['country']}"
    puts "| ZIP: #{info['zip']}"
    puts "| ISP: #{info['isp']}"
    puts '============================='
    puts
  end
elsif opt == nil && arg != nil
  url = "http://ip-api.com/json/#{arg.join}"
  response = RestClient.get(url)
  info = JSON.parse(response)

  if info['status'] == 'fail'
    puts 'No IP found'
  else
    puts
    puts '============================='
    puts "| IP: #{info['query']}"
    puts "| City: #{info['city']}"
    puts "| Region: #{info['region']}"
    puts "| Country: #{info['country']}"
    puts "| ZIP: #{info['zip']}"
    puts "| ISP: #{info['isp']}"
    puts '============================='
    puts
  end
elsif opt != nil && arg != nil
  url = "http://ip-api.com/json/#{arg.join}"
  response = RestClient.get(url)
  info = JSON.parse(response)

  if opt == 'ip'
    puts info['query']
  elsif opt == 'city'
    puts info['city']
  elsif opt == 'region'
    puts info['region']
  elsif opt == 'country'
    puts info['country']
  elsif opt == 'zip'
    puts info['zip']
  elsif opt == 'isp'
    puts info['isp']
  else
    puts 'Bad input'
  end
else
  puts 'Bad input'
end
