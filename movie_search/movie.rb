#!/usr/bin/env ruby
# CLI app that searched movies and returns info

require 'Rest-Client'
require 'json'

# Word wrapping method
def wrap(s, width=78)
  s.gsub(/(.{1,#{width}})(\s+|\Z)/, "\\1\n| ")
end

def movie_search
  # This is a live API key, don't absue it
  api_key = "946f500a"

  # Captures user input
  puts ""
  print "Movie =>  "
  movie_name = gets.chomp

  # Program escape statements
  if movie_name == "quit" || movie_name == "exit"
    puts ""
    exit(0)
  else
    # API fetch for movie
    url = "http://www.omdbapi.com/?t=#{movie_name}&apikey=#{api_key}"
    response = RestClient.get(url)
    info = JSON.parse(response)
  end

  # Exception for invalid response
  if info["Response"] == "False"
    puts ""
    puts "No Movie Found"
    puts ""
    exit(0)
  else
    # Rescue if no tomato score
    # Word wrap added to plot and actors
    begin
      title = info["Title"]
      year = info["Year"]
      score = info["Ratings"][1]["Value"]
    rescue
      score = "No Score Found"
    end

    rated = info["Rated"]
    genre = info["Genre"]
    director = info["Director"]
    actors = wrap(info["Actors"], 48)
    plot_unformatted = info["Plot"]
    plot = wrap(plot_unformatted, 48)

    # Format for printing to screen
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
end

movie_search
