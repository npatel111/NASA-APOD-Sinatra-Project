class NasaAdapter
  API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  attr_accessor :date, :uri, :api_response

  def self.hit_api(date)
    @uri = URI("https://api.nasa.gov/planetary/apod?api_key=#{API_KEY}&date=#{date}&hd=true")
    response = Net::HTTP.get(@uri)
    @api_response=  JSON.parse(response)
  end

  def self.create_location(date)
    self.hit_api(date)
    Location.create(date_traveled: @api_response["date"], explanation: @api_response["explanation"], title: @api_response["title"], url: @api_response["url"])
  end

  def self.update_location(date)
    self.hit_api(date)
    {date_traveled: @api_response["date"], explanation: @api_response["explanation"], title: @api_response["title"], url: @api_response["url"]}
  end
  
end
