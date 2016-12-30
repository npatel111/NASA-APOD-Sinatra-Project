class MessagesController < ApplicationController
  get '/messages' do
    @messages = Message.all
    erb :"/messages/index"
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    @message = Message.create(params)
    redirect to "/messages/#{@message.id}"
  end

  get '/messages/:id' do
    # byebug
    @message = Message.find(params[:id])
    erb :'/messages/show'
  end

  get '/messages/:id/edit' do
    @message = Message.find(params[:id])
    erb :'/messages/edit'
  end

  post '/messages/:id' do
    @message = Message.find(params[:id])
    @message.update(params["message"])
    redirect to "/messages/#{@message.id}"
  end

  post '/messages/:id/delete' do
    @message = Message.find(params[:id])
    @message.delete
    redirect to '/messages'
  end
end
