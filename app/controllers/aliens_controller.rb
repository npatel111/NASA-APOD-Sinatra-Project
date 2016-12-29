class AliensController < ApplicationController
  get '/aliens/new' do
    erb :'/aliens/new'
  end

  post '/aliens' do
    @alien = Alien.create(params)
    redirect to "aliens/#{@alien.id}"
  end

  get '/aliens/:id' do
    byebug
    erb :show
  end

  get '/aliens' do
    # byebug
    @aliens = Alien.all
    erb :'/aliens/index'
  end

end
