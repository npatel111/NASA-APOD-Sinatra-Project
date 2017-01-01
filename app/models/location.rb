class Location < ActiveRecord::Base
  has_many :aliens
  attr_accessor :date, :uri, :api_response

  def self.most_popular_location
    names = Alien.list_of_alien_locations
    names.compact.max_by { |word| names.count(word)}
  end

  def self.least_popular_location
    names = Alien.list_of_alien_locations
    names.compact.min_by { |word| names.count(word)}
  end

  def aliens_here
    if self.aliens.length > 0
      list_aliens
    else
      "No aliens live here!"
    end
  end

  def list_aliens
    self.aliens.map do |alien|
      alien.name
    end.join(", ")
  end

  def list_messages
    self.aliens.map do |alien|
      if alien.messages.length > 0
        alien.show_messages
      end
    end.compact.join(", ")
  end

  def image?
    !self.url.include?("youtube")
  end

end
