# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# dougs code template ↓
require 'open-uri'
Bookmark.destroy_all
Movie.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

#conver genres to strings
genre_hash = {
  action: 28,
  animated: 16,
  documentary: 99,
  drama: 18,
  family: 10751,
  fantasy: 14,
  history: 36,
  comedy: 35,
  war: 10752,
  crime: 80,
  music: 10402,
  mystery: 9648,
  romance: 10749,
  scifi: 878,
  horror: 27,
  TVmovie: 10770,
  thriller: 53,
  western: 37,
  adventure: 12
}


response['results'].each do |movie_hash|
  puts
  p movie_hash
  # create an instance with the hash
  if movie_hash['original_language'] == 'en' || movie_hash['original_language'] == 'ja'
    Movie.create!(
      title: movie_hash['original_title'],
      overview: movie_hash['overview'],
      poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
      rating: movie_hash['vote_average'],
      genre: genre_hash.key(movie_hash['genre_ids'][0])
    )
  end
end
