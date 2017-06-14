#!/usr/bin/env ruby
# CLI app that searched movies and returns info

require 'Rest-Client'
require 'json'
require 'word_wrap'

# Word wrapping method
def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n| ")
end

def movie_search

  api_key = "1234567"

  print "Movie =>  "
  movie_name = gets.chomp
  url = "http://www.omdbapi.com/?t=#{movie_name}&apikey=#{api_key}"
  response = RestClient.get(url)
  info = JSON.parse(response)

  title = info["Title"]
  year = info["Year"]
  score = info["Ratings"][1]["Value"]
  rated = info["Rated"]
  genre = info["Genre"]
  director = info["Director"]
  actors = wrap(info["Actors"], 48)
  plot_unformatted = info["Plot"]

  plot = wrap(plot_unformatted, 48)

  puts ""
  puts "=================================================="
  puts "| Title: #{title}"
  puts "| Year: #{year}"
  puts "| Tomato: #{score}"
  puts "| Rated: #{rated}"
  puts "| Genre: #{genre}"
  puts "| Director: #{director}"
  puts "| Actors: #{actors}"
  puts "| Plot: #{plot}"
  puts "=================================================="
  puts ""
end

movie_search
