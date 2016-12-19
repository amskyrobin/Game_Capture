require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( './models/game' )
require_relative( './models/publisher' )



#landing page

get '/home' do
erb(:welcome)
  end

#inventory page
get '/games' do 
  @games = Game.all
  erb(:index)
  end

#form to add a new game

get '/games/new' do
  erb(:new)
end

#show more info about specific game

get '/games/:id' do 
  search_id = params[:id]
  @game = Game.find(search_id)
  erb(:show)

end

#create a game using params

post '/games' do 
  @game = Game.new(params)
  @game.save()
  erb(:create)
end 

#will actively delete a game

post '/games/:id/delete' do 
  Game.destroy(params[:id])
  redirect to("/games")
end

#will provide  a form to edit a games info

get '/games/:id/edit' do
  @game = Game.find(params[:id])
  erb(:edit)
end

# will push through the edit form and show updated games info 

post '/games/:id' do
  Game.update(params) 
  redirect to("/games/#{params[:id]}")
end



