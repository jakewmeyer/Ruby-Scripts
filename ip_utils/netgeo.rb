#!/usr/bin/env ruby

#
# Simple CLI app for basic network information
# with options for nice output or simple stdout
# to make all your piping dreams come true.
#


require 'slop'
require 'rest-client'
require 'json'
require 'os'
require 'socket'


def netutil
  opts = Slop.parse do |o|
    o.banner = 'Usage: netgeo [flag] [option]'

    # Gets WAN address
    o.on '-w', '--wan', 'Returns WAN IP' do
      url = "https://api.ipify.org"
      response = RestClient.get(url)
      puts response
    end

    # Gets LAN(s)
    o.on '-l', '--lan', 'Returns LAN(s) IP(s)' do
      lans = Socket.ip_address_list.select{|intf| intf.ipv4_private?}.map { |intf| intf.ip_address }
      puts lans.join(', ')
    end

    # Gets Router IP
    o.on '-r', '--router', 'Returns Router IP' do
      if OS.linux?
        router = %x[ip route | grep default | head -1 | awk '{print$3}']
      elsif OS.mac?
        router = %x[netstat -rn | grep default | head -1 | awk '{print$2}']
      else
        puts "OS not supported!"
        exit(1)
      end
      puts router
    end

    # Gets DNS nameserver
    o.on '-d', '--dns', 'Returns DNS Nameserver' do
      if OS.linux?
        dns = %x[cat /etc/resolv.conf | grep nameserver | head -1 | awk '{print$2}']
      elsif OS.mac?
        dns = %x[scutil --dns | grep nameserver | head -1 | awk '{print$3}']
      else
        puts "OS not supported!"
        exit(1)
      end
      puts dns
    end

    o.on '-g', '--geo', 'Returns Current IP Geodata' do
      url = "http://ip-api.com/json/"
      response = RestClient.get(url)
      info = JSON.parse(response)
      puts info['query']
      puts info['city']
      puts info['region']
      puts info['country']
      puts info['zip']
      puts info['isp']
    end
    o.separator ''
    o.separator 'Custom Geo Output:'
    o.separator '[all] [ip] [city] [region] [country] [zip] [isp]'
    o.separator 'Example: netgeo -s ip,city,isp 8.8.8.8'
    o.array '-s', '[options] [ip address]', 'Specific Geodata'
    o.on '-h', '--help', 'version 1.0.0' do
      puts o
      exit
    end
  end

  options = opts[:s]
  ip = opts.arguments || ''

  url = "http://ip-api.com/json/#{ip.join}"
  response = RestClient.get(url)
  info = JSON.parse(response)
  if options.include? 'all'
    puts info['query']
    puts info['city']
    puts info['region']
    puts info['country']
    puts info['zip']
    puts info['isp']
  else
    puts info['query'] if options.include? 'ip'
    puts info['city'] if options.include? 'city'
    puts info['region'] if options.include? 'region'
    puts info['country'] if options.include? 'country'
    puts info['zip'] if options.include? 'zip'
    puts info['isp'] if options.include? 'isp'
  end
end

netutil
