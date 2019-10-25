class Beer < ActiveRecord::Base

    has_many :taproom
    has_many :reviews
    has_many :users, through: :taproom

end