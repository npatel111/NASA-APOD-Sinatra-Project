require 'net/http'
require 'json'
class Location < ActiveRecord::Base
  has_many :aliens
  attr_accessor :date, :uri, :api_response

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
