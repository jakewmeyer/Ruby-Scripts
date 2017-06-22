#!/usr/bin/env ruby
# Gets WAN IP, Lan IP, Router IP, and DNS Server.
# Compiles to a nice list.

require 'rest-client'
require 'socket'

def network_info
  # Grabs public WAN address.
  begin
    url = "https://api.ipify.org"
    response = RestClient.get(url)
  rescue
    puts "Can't find WAN"
    exit(1)
  end

  # Grabs assigned IP and formats it.
  begin
    lan_array = Socket.ip_address_list.select{|intf| intf.ipv4_private?}
    lan1 = lan_array[0].ip_address
    lan2 = lan_array[1]

    if lan2.nil?
    else
      lan2 = lan2 = lan_array[1].ip_address
    end
  rescue
    puts "Cant find LAN"
    exit(1)
  end

  # Greps scutil for DNS server.
  begin
    dns = %x[scutil --dns | grep nameserver | head -1 | awk '{print$3}']
  rescue
    puts "Can't find DNS"
    exit(1)
  end

  # Greps netstat for router address.
  begin
    router = %x[netstat -rn | grep default | head -1 | awk '{print$2}']
  rescue
    puts "Can't find Router"
    exit(1)
  end

  if lan2.nil?
    puts
    puts "======================"
    puts "| WAN: #{response}"
    puts "| LAN: #{lan1}"
    puts "| ROUTER: #{router}"
    puts "| DNS: #{dns}"
    puts "======================"
    puts
  else
    puts
    puts "======================"
    puts "| WAN: #{response}"
    puts "| LAN 1: #{lan1}"
    puts "| LAN 2: #{lan2}"
    puts "| ROUTER: #{router}"
    puts "| DNS: #{dns}"
    puts "======================"
    puts
  end
end

network_info
