
User Stories

-as a user, I want to be able to retrieve personal information about a given actor
-as a user I want to be able to see a given actor's characters, and character's favorite quote
-as a user I want to be able to retrieve all the movies for a given actor
-as a user, I want to be able to add an actor to the app, if the actor doesn't belong in the apps database yet, update the information on the existing actor, or delete an actor from the database

    Domain model - IMDb domain
Genre <- Movie -> Role <-  Actor


- movie belongs to a genre
- movie has many roles
- actors have many roles
- roles belong to movie
- roles belong to actors
"Roles" is going to be our join table. Setting the "foreign keys" for our artists and for our movies in the roles table, we are able to set the associations for our models


Schema :

ActiveRecord::Schema.define(version: 2019_04_16_143332) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "manager"
    t.integer "num_of_oscars_won"
    t.string "country_of_origin"
    t.integer "height"
    t.integer "net_income"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.integer "release_year"
    t.string "country_of_origin"
    t.string "language_spoken"
    t.string "filming_location"
    t.integer "revenues"
    t.integer "rating"
    t.integer "num_of_oscars_won"
    t.integer "genre_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "movie_id"
    t.integer "actor_id"
    t.string "quotes"
  end

end
