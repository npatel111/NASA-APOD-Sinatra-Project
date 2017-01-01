class Message < ActiveRecord::Base
  belongs_to :alien

  def show_alien
    if self.alien
      "#{self.alien.name} " +
      "from #{self.alien.location.title}" if self.alien.location
    else
      "We don't know yet"
    end
  end

  def self.first_message_ever
    self.find(1).content
  end

  def self.location_with_most_messages
    Alien.all.each_with_object({}) {|alien, hash|
      if alien.location
        hash[alien.location.title] ||= 0
        hash[alien.location.title] += alien.messages.length
      end
    }.max_by {|location, count| count }.first
  end


end
