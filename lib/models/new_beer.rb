require 'rest-client'
require 'json'
require 'pry'


class NewBeer

the_key = ENV["BEER_API_KEY"] 
API_URL = 'http://api.brewerydb.com/v2/beers/' + the_key 


def get_from_api
  endpoint = API_URL 
  RestClient.get(endpoint)
end

def parse_response(response)
  JSON.parse(response)
end

def display_beer(beer_hash)
 p beer_hash
  book_items = beer_hash
  book_items.each do |book|
    puts "*" * 30
    puts book["volumeInfo"]["title"]
    puts book["volumeInfo"]["authors"]
    puts book["volumeInfo"]["description"]
  end
  true
end

def run
  resp = get_from_api
  beer_hash = parse_response(resp)
  display_beer(beer_hash)
end

    # def try_this
    # puts "Here's a new Beer"
    # end

end