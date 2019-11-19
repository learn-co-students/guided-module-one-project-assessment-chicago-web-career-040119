class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie


  def say_that_thing_you_say
    "#{self.name} always says: #{self.quotes}"
  end

  def list_actor_name
    self.actor.name
  end

  def list_name
    self.name
  end

end
