require 'net/http'
require 'json'
class Location < ActiveRecord::Base
  has_many :aliens
  # API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  attr_accessor :date, :uri, :api_response

  def aliens_here
    # byebug
    if self.aliens.length > 0
      # byebug
      list_aliens
      # list_messages
    else
      "No aliens live here!"
    end
  end

  def list_aliens
    # byebug
    self.aliens.map do |alien|
      alien.name
    end.join(", ")#oh dear. Not sure why it doesn't make a normal list?
  end

  def list_messages
    self.aliens.map do |alien|
      if alien.messages.length > 1
        alien.messages.map do |message|
          message.content
        end
      end
    end.compact.flatten.join(", ")#ugh
  end


  def image?
    !self.url.include?("youtube")
  end

  # def show_image_or_video
  #   if self.url.include?("youtube")
  #     return "<iframe width="420" height="315"
  #     src="${self.url}">"
  #   else
  #     return "<img src="<${self.url}" alt="self.title" >"
  #   end
  # end
end
#Move into adapter folder, create a new Active Record thing for location
