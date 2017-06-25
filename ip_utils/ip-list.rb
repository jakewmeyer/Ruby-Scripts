#!/usr/bin/env ruby
# Gets WAN IP, Lan IP, Router IP, and DNS Server.
# Compiles to a nice list.

require 'rest-client'
require 'socket'
require 'os'

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
    lans = Socket.ip_address_list.select{|intf| intf.ipv4_private?}.map { |intf| intf.ip_address }
  rescue
    puts "Cant find LAN"
    exit(1)
  end

  # Greps either scutil or resolv.conf for DNS server.
  begin
    if OS.linux?
      dns = %x[cat /etc/resolv.conf | grep nameserver | head -1 | awk '{print$2}']
    elsif OS.mac?
      dns = %x[scutil --dns | grep nameserver | head -1 | awk '{print$3}']
    else
      puts "OS not supported!"
      exit(1)
    end
  rescue
    puts "Can't find DNS"
    exit(1)
  end

  # Greps netstat or ip route for router address.
  begin
    if OS.linux?
      router = %x[ip route | grep default | head -1 | awk '{print$3}']
    elsif OS.mac?
      router = %x[netstat -rn | grep default | head -1 | awk '{print$2}']
    else
      puts "OS not supported!"
      exit(1)
    end
  rescue
    puts "Can't find Router"
    exit(1)
  end

  puts
  puts "======================="
  puts "| WAN: #{response}"
  puts "| LAN(s): #{lans.join(', ')}"
  puts "| ROUTER: #{router}"
  puts "| DNS: #{dns}"
  puts "======================="
  puts
end

network_info
