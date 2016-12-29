class LocationsController < ApplicationController
  # API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  get '/locations' do
    @locations = Location.all
    # @api_response = Location.new.hit_api
    erb :'/locations/index'
  end

  get '/locations/new' do
    erb :'/locations/new'
  end

  post '/locations' do
    # byebug
    @date = params["date"]
    @api_response = Location.new.hit_api(@date)
    # byebug
    @location = Location.create(date_traveled: @date, explanation: @api_response["explanation"], title: @api_response["title"], url: @api_response["url"])
    byebug
    redirect to "/locations"
  end
end
