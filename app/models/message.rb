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

end
