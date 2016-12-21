require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( './models/game' )
require_relative( './models/publisher' )



#landing page

get '/home' do
  erb(:welcome)
end

#shows all games
get '/games' do 
  @games = Game.all
  erb(:index)
end

#form to add a new game

get '/games/new' do
  @publishers = Publisher.all
  erb(:new)
end

#show more info about specific game

get '/games/:id' do 
  @game = Game.find(params[:id])
  erb(:show)
end

#create a game using params

post '/games' do 
  @game = Game.new(params)
  @game.save()
  redirect to("/games")
end 

#will actively delete a game

post '/games/:id/delete' do 
  Game.destroy(params[:id])
  redirect to("/games")
end

#will provide  a form to edit a games info

get '/games/:id/edit' do
  @publishers = Publisher.all
  @game = Game.find(params[:id])
  erb(:edit)
end

# will push through the edit form and show updated games info 

post '/games/:id' do
  Game.update(params) 
  redirect to("/games/#{params[:id]}")
end

# form to make new publisher

get '/publishers/new' do
  @publishers = Publisher.all
  erb(:new_publisher)
end


