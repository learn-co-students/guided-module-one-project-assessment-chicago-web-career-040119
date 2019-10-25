# require 'rest-client'
# require 'json'
# require 'pry'
# require 'uri'

# API_URL = `http://api.brewerydb.com/v2/beer/oeGSxs/?key=f73fe18da57aa36269dec82f844ac08f`
# URI.parse(URI.encode(API_URL))

#     RestClient.get(API_URL)
#     p JSON.parse(response)


require 'faker'

Beer.destroy_all
User.destroy_all
Taproom.destroy_all
Review.destroy_all

review_number = 20
user_number = 20
beer_number = 20
taproom_number = 20
    

user_number.times do
    user = User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.free_email,
      password: Faker::Internet.password,
      about_me: Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)

    )
  end

beer_number.times {
    beer = Beer.create(
        name: Faker::Hipster.word,
        abv: Faker::Beer.alcohol,
        description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
        style: Faker::Beer.style,
        brewery: Faker::Hipster.words(number: 2),
        location: Faker::Nation.capital_city,
        is_organic: [true, false].sample
    )
}

review_number.times {
  review = Review.create(
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    rating: (1..5).to_a.sample,
    beer_id: (1..beer_number).to_a.sample,
    user_id: (1..user_number).to_a.sample
  )
}

taproom_number.times {
  taproom = Taproom.create(
    beer_id: (1..beer_number).to_a.sample,
    user_id: (1..user_number).to_a.sample,
    is_loved: [true, false].sample
  )
}





