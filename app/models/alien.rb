class Alien < ActiveRecord::Base
  has_many :messages
  belongs_to :location
  has_many :alien_powers
  has_many :powers, through: :alien_powers

  def alien_home
    if self.location
      "location: #{self.location.title}"
    else
      "This alien doesn't have a home location yet"
    end
  end

  def show_messages
    if self.messages.length > 0
      self.messages.each do |message|
        return message.content
      end
    else
      "No messages yet"
    end
  end

  def show_powers
    # byebug
    if self.powers.length > 0
      self.powers.map do |power|
        power.name
      end
    else
      "This alien has no powers yet"
    end
  end

end
