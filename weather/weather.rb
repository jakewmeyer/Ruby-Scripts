#!/usr/bin/env ruby
# CLI app that brings in current location weather

require 'rest-client'
require 'json'

def weather_search
    # This key is functional, please don't abuse it
    api_key = "6510b92495fd472ca30155709172803&q"

    # Uses IP to get current city
    begin
    url = "http://ip-api.com/json"
    response = RestClient.get(url)
    parsed = JSON.parse(response)
    location = parsed["city"]
    rescue
        puts "No IP Response"
        exit(0)
    end

    # Uses city to fetch weather
    begin
    url = "https://api.apixu.com/v1/current.json?key=#{api_key}=#{location}"
    response = RestClient.get(url)
    parsed = JSON.parse(response)

    # Assigning values to variables
    location_name = parsed["location"]["name"]
    temp = parsed["current"]["temp_f"]
    wind_speed = parsed["current"]["wind_mph"]
    humidity = parsed["current"]["humidity"]
    feels_like = parsed["current"]["feelslike_f"]
    visability = parsed["current"]["vis_miles"]
    rescue
        puts "No Weather API Response"
        exit(0)
    end

    puts ""
    puts "======================"
    puts "| City: #{location_name}"
    puts "| Temp: #{temp}°"
    puts "| Feels Like: #{feels_like}°"
    puts "| Humidity: #{humidity}%"
    puts "| Wind Speed: #{wind_speed} mph"
    puts "| Visability: #{visability} mi"
    puts "======================"
    puts ""
end

weather_search
