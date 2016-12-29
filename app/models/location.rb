require 'net/http'
require 'json'
class Location < ActiveRecord::Base
  has_many :aliens
  API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  attr_accessor :date, :uri, :api_response
  # working URL =https://api.nasa.gov/planetary/apod?api_key=Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG&date=2016-12-10


  def hit_api(date)
    # byebug
    @uri = URI("https://api.nasa.gov/planetary/apod?api_key=#{API_KEY}&date=#{date}&hd=true")
    response = Net::HTTP.get(@uri)
    return JSON.parse(response)
  end
end
