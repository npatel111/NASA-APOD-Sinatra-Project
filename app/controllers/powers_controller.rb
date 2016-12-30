class PowersController < ApplicationController

  get '/powers' do
    # @power = Power.create(name: "speed", alien_ids:["1", "4", "11"])
    @powers = Power.all
    # byebug
    erb :'/powers/index'
  end

  get '/powers/new' do
    erb :'/powers/new'
  end

  post '/powers' do
    @power = Power.create(params)
    redirect to "/powers/#{@power.id}"
  end

  get '/powers/:id' do
    @power = Power.find(params[:id])
    erb :'/powers/show'
  end

  get '/powers/:id/:edit' do
    @power = Power.find(params[:id])
    erb :'/powers/edit'
  end

  post '/powers/:id' do
    @power = Power.find(params[:id])
    @power.update(params["power"])
    redirect to "/powers/#{@power.id}"
  end

  post '/powers/:id/delete' do
    @power = Power.find(params[:id])
    @power.delete
    redirect to "/powers"
  end




end
