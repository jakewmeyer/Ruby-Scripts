#!/usr/bin/env ruby
# CLI app that returns current crptocurrency prices

require 'json'
require 'uri'
require 'net/http'
require 'colorize'


def get_price(coins)
  uri = URI("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{coins}&tsyms=USD")
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  if data['Response']
    puts "Coin not found"
    exit(1)
  else
    data
  end
end

def printer(data, coin)
  symbol = data["RAW"][coin]["USD"]["FROMSYMBOL"]
  price = data["RAW"][coin]["USD"]["PRICE"]
  chg = data["RAW"][coin]["USD"]["CHANGE24HOUR"].round(4)
  chgpct = data["RAW"][coin]["USD"]["CHANGEPCT24HOUR"].round(4)
  high = data["RAW"][coin]["USD"]["HIGH24HOUR"]
  low = data["RAW"][coin]["USD"]["LOW24HOUR"]

  puts "Symbol: #{symbol}"
  puts "Price: $#{price}"
  chg.positive? ? (puts "Chg: " + "+#{chg}".green) : (puts "Chg: " + "#{chg}".red)
  chgpct.positive? ? (puts "Chg %: " + "+#{chgpct}%".green) : (puts "Chg %: " + "#{chgpct}%".red)
  puts "24h High: $#{high}"
  puts "24h Low: $#{low}"
end

usage = "usage: crypto [symbol]\nexample: crypto xmr btc ltc"

if ARGV.empty?
    puts usage
else
  coins = ARGV.join(",").upcase
  data = get_price(coins)

  ARGV.count.times do |i|
    puts "=========================="
    printer(data, ARGV[i].upcase)
  end
  puts "=========================="
end
