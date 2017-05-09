#!/usr/bin/env ruby
# CLI app that searched movies and returns info

require 'Rest-Client'
require 'json'

def movie_search()
  print "Enter a movie title -> "
  movie_name = gets.chomp
  url = "http://www.omdbapi.com/?t=#{movie_name}"
  response = RestClient.get(url)
  info = JSON.parse(response)

  title = info["Title"]
  year = info["Year"]
  score = info["Metascore"]
  rated = info["Rated"]
  genre = info["Genre"]
  director = info["Director"]
  actors = info["Actors"]
  plot = info["Plot"]

  puts "Title: #{title}"
  puts "Year: #{year}"
  puts "Metascore: #{score}"
  puts "Rated: #{rated}"
  puts "Genre: #{genre}"
  puts "Director: #{director}"
  puts "Actors: #{actors}"
  puts "Plot: #{plot}"
end

movie_search()  

