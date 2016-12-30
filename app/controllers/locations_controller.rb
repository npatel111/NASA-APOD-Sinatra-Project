class LocationsController < ApplicationController
  # API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  get '/locations' do
    @locations = Location.all
    # @api_response = Location.new.hit_api
    # byebug
    erb :'/locations/index'
  end

  get '/locations/new' do
    erb :'/locations/new'
  end

  post '/locations' do
    @date = params["date"]
    @location = NasaAdapter.create_location(@date)
    redirect to "/locations"
  end

  post '/locations/:id' do
    @location = Location.find(params[:id])
    @date = params["date"]
    @api_response = Location.new.hit_api(@date)
    @location.date_traveled = @date
    @location.explanation = @api_response["explanation"]
    @location.title = @api_response["title"]
    @location.url = @api_response["url"]
    @location.save
    redirect to "/locations/#{@location.id}"
  end

  get '/locations/:id' do
    # byebug
    @location = Location.find(params[:id])
    erb :'locations/show'
  end

  get '/locations/:id/edit' do
    @location = Location.find(params[:id])
    erb :'locations/edit'
  end

  post '/locations/:id/delete' do
    @location = Location.find(params[:id])
    @location.delete
    redirect to '/locations'
  end

end
