class AliensController < ApplicationController
  get '/aliens/new' do
    erb :'/aliens/new'
  end

  post '/aliens' do
    @alien = Alien.create(params)
    redirect to "/aliens/#{@alien.id}"
  end

  get '/aliens/:id' do
    @alien = Alien.find(params[:id])
    # byebug
    erb :'/aliens/show'
  end

  get '/aliens/:id/edit' do
    @alien = Alien.find(params[:id])
    erb :'/aliens/edit'
  end

  post '/aliens/:id' do
    @alien = Alien.find(params[:id])
    @alien.update(params["alien"])
    redirect to "/aliens/#{@alien.id}"
  end

  get '/aliens' do
    # byebug
    @aliens = Alien.all
    erb :'/aliens/index'
  end

  post '/aliens/:id/delete' do
    @alien = Alien.find(params[:id])
    @alien.delete
    redirect to '/aliens'
  end

end
