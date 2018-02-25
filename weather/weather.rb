#!/usr/bin/env ruby
# CLI app that brings in current location weather.

require 'json'
require 'uri'
require 'net/http'

def weather
  api_key = ENV['APIXU_API_KEY'] || "6510b92495fd472ca30155709172803&q"

  ip = get_ip
  city = ARGV[0] || ip["city"]
  state = ARGV[1] || ip["region"]
  country = ip["countryCode"]

  weather = get_weather(api_key, city, state)

  if country == "US"
    us_printer(weather)
  else
    intl_printer(weather)
  end
end

def get_ip
  uri = URI("http://ip-api.com/json")
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def get_weather(api_key, city, state)
    uri = URI("https://api.apixu.com/v1/current.json?key=#{api_key}=#{city}+#{state}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
end

def us_printer(parsed)
  # Printer for US users
  location_name = parsed["location"]["name"]
  temp = parsed["current"]["temp_f"]
  wind_speed = parsed["current"]["wind_mph"]
  humidity = parsed["current"]["humidity"]
  feels_like = parsed["current"]["feelslike_f"]
  visibility = parsed["current"]["vis_miles"]

  puts "======================"
  puts "City: #{location_name}"
  puts "Temp: #{temp}°F"
  puts "Feels Like: #{feels_like}°F"
  puts "Humidity: #{humidity}%"
  puts "Wind Speed: #{wind_speed} mph"
  puts "Visibility: #{visibility} mi"
  puts "======================"
end

def intl_printer(parsed)
  # Printer for metric users
  location_name = parsed["location"]["name"]
  temp = parsed["current"]["temp_c"]
  wind_speed = parsed["current"]["wind_kph"]
  humidity = parsed["current"]["humidity"]
  feels_like = parsed["current"]["feelslike_c"]
  visibility = parsed["current"]["vis_km"]

  puts "======================"
  puts "City: #{location_name}"
  puts "Temp: #{temp}°C"
  puts "Feels Like: #{feels_like}°C"
  puts "Humidity: #{humidity}%"
  puts "Wind Speed: #{wind_speed} kph"
  puts "Visibility: #{visibility} km"
  puts "======================"
end

weather
