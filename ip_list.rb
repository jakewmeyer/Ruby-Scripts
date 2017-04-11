#!/usr/bin/env ruby
# Gets public IP, Lan IP, router IP, and DNS IP
# Compiles to a nice list

require 'Rest-Client'
require 'Socket'

url = "https://api.ipify.org"
response = RestClient.get(url)

ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
lan = ip.ip_address

dns = %x[scutil --dns | grep nameserver | head -1 | awk '{print$3}']
router = %x[netstat -rn | grep default | head -1 | awk '{print$2}']

puts "WAN: #{response}"
puts "LAN: #{lan}"
puts "ROUTER: #{router}"
puts "DNS: #{dns}"