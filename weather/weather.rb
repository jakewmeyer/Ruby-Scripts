#!/usr/bin/env ruby
# CLI app that brings in current location weather.

require 'rest-client'
require 'json'

def weather_search
  # This key is functional, please don't abuse it
  api_key = ENV['APIXU_API_KEY'] || "6510b92495fd472ca30155709172803&q"

  # Uses IP to get current city
  begin
    url = "http://ip-api.com/json"
    response = RestClient.get(url)
    parsed = JSON.parse(response)
    location = ARGV || parsed["city"]
  rescue RestClient::BadRequest
    puts "No IP address found"
    exit(1)
  end

  # Uses city to fetch weather
    begin
      url = "https://api.apixu.com/v1/current.json?key=#{api_key}=#{location}"
      response = RestClient.get(url)
    rescue RestClient::BadRequest
      puts "Location not found"
      exit(1)
    end
    parsed = JSON.parse(response)

    country = parsed["location"]["country"]

    if country == "United States of America"
      # Assigning values to variables
      location_name = parsed["location"]["name"]
      temp = parsed["current"]["temp_f"]
      wind_speed = parsed["current"]["wind_mph"]
      humidity = parsed["current"]["humidity"]
      feels_like = parsed["current"]["feelslike_f"]
      visibility = parsed["current"]["vis_miles"]

      # Output for United States
      puts
      puts "======================"
      puts "| City: #{location_name}"
      puts "| Temp: #{temp}°F"
      puts "| Feels Like: #{feels_like}°F"
      puts "| Humidity: #{humidity}%"
      puts "| Wind Speed: #{wind_speed} mph"
      puts "| Visibility: #{visibility} mi"
      puts "======================"
      puts
    else
      # Assigning values to variables
      location_name = parsed["location"]["name"]
      temp = parsed["current"]["temp_c"]
      wind_speed = parsed["current"]["wind_kph"]
      humidity = parsed["current"]["humidity"]
      feels_like = parsed["current"]["feelslike_c"]
      visibility = parsed["current"]["vis_km"]

      # Output for Metric countries
      puts
      puts "======================"
      puts "| City: #{location_name}"
      puts "| Temp: #{temp}°C"
      puts "| Feels Like: #{feels_like}°C"
      puts "| Humidity: #{humidity}%"
      puts "| Wind Speed: #{wind_speed} kph"
      puts "| Visibility: #{visibility} km"
      puts "======================"
      puts
    end
end

weather_search
