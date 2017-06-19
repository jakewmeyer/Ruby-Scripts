#!/usr/bin/env ruby

# Decrypts files easily using
# openssl commands. Essentially
# an easy wrapper for openssl

# Ex. $ decrypt encrypted.txt names.txt

def decrypt
  input_file = ARGV[0]
  output_file = ARGV[1]
  %x[openssl enc -aes-256-cbc -salt -a -in #{input_file} -out #{output_file}]
end

decrypt
