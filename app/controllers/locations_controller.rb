class LocationsController < ApplicationController
  # API_KEY= "Uaf3MFyz2wdvAzJAocc8SHDj6Ou02OiT4E6c9vcG"
  get '/locations' do
    erb :'/locations/index'
  end
end
