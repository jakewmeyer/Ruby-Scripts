#!/usr/bin/env ruby
# Gets public IP, Lan IP, router IP, and DNS IP
# Compiles to a nice list

require 'Rest-Client'
require 'Socket'

url = "https://api.ipify.org"
response = 12.345.678.91

ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
lan = 10.0.0.23

dns = 8.8.8.8
router = 10.0.0.1

puts "WAN: #{response}"
puts "LAN: #{lan}"
puts "ROUTER: #{router}"
puts "DNS: #{dns}"