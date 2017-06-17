#!/usr/bin/env ruby

# Encrypts files easily using
# openssl commands. Essentially
# an easy wrapper for openssl

require 'optparse'

def padlock
  options = {}

  # Parser for CLI flags and options
  OptionParser.new do |opts|

    opts.banner = "Usage: padlock [options] [filename]"
    opts.separator ""
    opts.separator "Command:"

    opts.on_tail("-e", "--encrypt ", "Encrypts the selected file.") do |e|
    options[:encrypt] = e
    end

    opts.on_tail("-d", "--decrypt " , "Decrypts the selected file.") do |d|
    options[:decrypt] = d
    end

    opts.on_tail("-h", "--help", "Show help message") do
      puts opts
      exit
    end

    opts.on_tail("-v", "--version", "Show version") do
      puts "Padlock v1.0.0"
    end
  end.parse!
end

padlock

input = ARGV

file = input[0]

%x[openssl enc -aes-256-cbc -salt -in #{file} -out #{file}.enc]
