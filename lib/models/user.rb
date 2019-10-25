class User < ActiveRecord::Base

    has_many :reviews
    has_many :taproom
    has_many :beers, through: :taproom



end