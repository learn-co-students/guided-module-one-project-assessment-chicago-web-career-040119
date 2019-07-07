Welcome to Music Industry!

User's Stories:

1. As a user, I want to see my artist’s demographics. (READ)
2. As a user, I want to see the songs of the artist associated with corresponding album (rating and genre). (READ)
3. As a user, I want to pick a song and find out the artist and the album. (READ)
4. As a user, I want to be able to enter and save a new artist in the app. (CREATE)
5. As a user, I want to be able to update and save any information about an artist. (UPDATE)
6. As a user, I want to remove/delete an artist from the app. (DELETE)

Step 0:

Domain model - Music App

Genre —< Album —-< Song >-— Artist

The following statements are considered true:
1. An artist has many songs, songs belong to artist. And has many albums through songs.
2. An album has many songs, songs belong to albums. And has many artists through songs
3. A genre has many albums, albums belong to genre.
4. A song belong to an artist and belongs to an album.

Steps 1-6:

1. Created associations between models (relationships)
2. Created the CLI interface to the application (forked&cloned lab)
Ran ‘bundle install’ and fixed Gemfile (specified sqlite version - gem 'sqlite3', '~> 1.3.6’). Ran ‘ruby bin/run.rb’
3. Created migrations (using rake) and checked schema constantly. Tested relationships.
4. Seeded Sqlite3 database using ActiveRecord (faker gem)
5. Used ActiveRecord methods to find out needed information
6. Tested all users’s options and tested the app

Table Albums
    - name
  	- year
  	- rating
  	- revenues
  	- albums_sold
  	- genre_id

  Table Songs
  	- name
  	- album_id
  	- artist_id

Table Artists
  	- name
  	- age
  	- gender
  	- country_of_origin
  	- income

Table Genre
    - name

How would I improve my app...

1. I would add a lot more real data.
2. I would add a user to my Domain Model.
3. I would use more Gems to improve the appearance of the app.
4. I would clean my code.
5. I would fix all bugs and I would fix the flow of the app.
