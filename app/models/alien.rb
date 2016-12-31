class Alien < ActiveRecord::Base
  has_many :messages
  belongs_to :location
  has_many :alien_powers
  has_many :powers, through: :alien_powers

  def picture
    "https://robohash.org/#{self.name}?set=any"
  end

  def self.count
    self.all.length
  end

  def alien_home
    if self.location
      "location: #{self.location.title}"
    else
      "This alien doesn't have a home location yet"
    end
  end

  def show_location
    if self.location
      "This alien lives in this location: #{self.location.title}"
    else
      "This location doesn't exist anymore."
    end
  end

  def show_messages
    if self.messages.length > 0
      self.messages.map do |message|
        message.content
      end.join(", ")
    else
      "No messages yet"
    end
  end

  def show_powers
    if self.powers.length > 0
      self.powers.map do |power|
        power.name
      end.join(", ")
    else
      "This alien has no powers yet"
    end
  end

end
