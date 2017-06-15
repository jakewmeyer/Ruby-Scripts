#!/usr/bin/env ruby
# Gets public IP, Lan IP, router IP, and DNS IP
# Compiles to a nice list

require 'Rest-Client'
require 'Socket'

def network_info()

  # Grabs public WAN address
  begin
  url = "https://api.ipify.org"
  response = RestClient.get(url)
  rescue
      puts "Can't find WAN"
      exit(0)
  end

  # Grabs assigned IP and formats it
  begin
  ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
  lan = ip.ip_address
  rescue
      puts "Cant find LAN"
      exit(0)
  end

  # Parses netstat and scutil for router and DNS
  dns = %x[scutil --dns | grep nameserver | head -1 | awk '{print$3}']
  router = %x[netstat -rn | grep default | head -1 | awk '{print$2}']

  puts ""
  puts "====================="
  puts "| WAN: #{response}"
  puts "| LAN: #{lan}"
  puts "| ROUTER: #{router}"
  puts "| DNS: #{dns}"
  puts "====================="
  puts ""
end

network_info()
