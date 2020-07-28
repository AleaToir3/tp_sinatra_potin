
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip   #attache le fichier avec gossip pour le html
  end

  # post '/gossips/new/' do
  #   puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  #   Gossip.new(gossip_author,gossip_content).save 

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/hello/:name' do |n|
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    # n stores params['name']
    "Hello #{n}!"
  end
  get '/gossips/:id/' do
    erb :show, locals: {gossips: Gossip.find(params[:id])}
  end
end 