
# harry_potter2_url =  "http://www.omdbapi.com/?t=harry+potter&apikey=399f4d8c"
# require "rest-client"
# require "json"
# require "pry"
#
# def get_data(url)
#   response = RestClient.get(url)
#   parsed = JSON.parse(response)
# end
#
# # response = RestClient.get(harry_potter2_url)
# # parsed_movie = JSON.parse(response)
# # #
# def create_movie(json)
#  Movie.create(
#    title: json["Title"]
#
#  )
# end
#
# harry_potter_json = get_data(url)
# # Movie.create(parsed_movie["Title"], parsed_movie["Director"], parsed_movie
# #


# binding.pry

# genre = Genre.all
#
#
# drama= Genre.create({name: "drama"})
# action = Genre.create({name: "action"})
# thriller = Genre.create({name: "thriller"})
# adventure=Genre.create({name: "adventure"})
# scifi = Genre.create({name: "scifi"})
# romance= Genre.create({name: "romance"})
#
# #
# #
# all_actors = ["Daniel Redclif", "Rupert Grint", "Emma Watson", "Emily Blunt", "Leonardo DiCaprio", "Angelina Jolie", "Brad Pitt", "Jennifer Aniston", "Bradley Cooper", "Jennifer Lawrance"]
#
# all_actors.each do |actor|
#   Actor.create(
#     name: actor,
#     age: Faker::Number.between(20, 60),
#     gender: Faker::Gender.binary_type,
#     manager: Faker::Name.name,
#     num_of_oscars_won: Faker::Number.between(0, 5),
#     country_of_origin: Faker::Address.country,
#     height: Faker::Number.between(5, 6),
#     net_income:  Faker::Number.between(20000, 60000)
#   )
# end


# movie  = Movie.all
#  all_movies = ["Harry Potter", "Lord of the Rings", "Inception", "Titanic"]
#  all_movies.each do |movie|
#   Movie.create(
#     title: movie,
#     director: Faker::Name.name,
#     release_year: Faker::Number.between(2000, 2020),
#     country_of_origin: Faker::Address.country,
#     language_spoken: Faker::ProgrammingLanguage.name,
#     filming_location: Faker::Address.country,
#     revenues: Faker::Number.between(100000, 600000),
#     rating: Faker::Number.between(1, 10),
#     num_of_oscars_won: Faker::Number.between(1, 5),
#     genre_id: Genre.all.sample.id
#     )
# end


#
# roles = Role.all
q
