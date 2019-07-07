
10.times do
  Genre.create(
    name: Faker::Music.genre
  )
end

artists = ['Cher', 'Pink', 'Madonna', 'Beyonce', 'Rihanna', 'Usher', 'Shakira', 'Tupac', 'Avicii', 'Inna']
    artists.each do |artist|
      Artist.create(
        name:artist,
        age: Faker::Number.between(10,85),
        gender: Faker::Gender.binary_type,
        country_of_origin: Faker::Address.country,
        income: Faker::Number.within(100000..999999999),
        num_grammys: Faker::Number.within(1..31)
      )
  end

  10.times do
    Album.create(
      name: Faker::Music.album,
      year: Faker::Number.between(1995,2019),
      rating: Faker::Number.between(1,10),
      revenues: Faker::Number.between(1000000, 5000000),
      num_albums_sold: Faker::Number.between(100000,2000000),
      genre_id: Genre.all.sample.id
    )
  end

  100.times do
    Song.create(
      name: Faker::Music::Phish.song,
      album_id: Album.all.sample.id,
      artist_id: Artist.all.sample.id
    )
  end






# Song.delete_all
# Genre.delete_all
# Artist.delete_all
# Album.delete_all
#
#
# pop = Genre.create({name: "pop"})
# rock = Genre.create({name: "rock"})
# alternative = Genre.create({name: "alternative"})
# jazz = Genre.create({name: "jazz"})
# blues = Genre.create({name: "blues"})
# classical = Genre.create({name: "classical"})
#
# top_tracks_url = 'http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=cher&api_key=57ee3318536b23ee81d6b27e36997cde&format=json'
#
# require 'rest-client'
# require 'json'
# require 'pry'
#
# def get_data(url)
#   response = RestClient.get url
#   parsed = JSON.parse(response)
# end
#
# def get_songs_info(artist)
# top_tracks_url = 'http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=' + artist + '&api_key=57ee3318536b23ee81d6b27e36997cde&format=json'
# artist_info_url = 'http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=' + artist + '&api_key=57ee3318536b23ee81d6b27e36997cde&format=json'
#
# songs = get_data(top_tracks_url)['toptracks']['track'].map do | track |
#     track['name']
# end
#
# listeners = get_data(artist_info_url)['artist']['stats']['listeners']
