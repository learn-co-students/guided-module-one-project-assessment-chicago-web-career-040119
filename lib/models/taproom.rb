class Taproom < ActiveRecord::Base
    belongs_to :user
    belongs_to :beer

def self.user_taproom(user)
self.where("user_id = ?", user)
end

end