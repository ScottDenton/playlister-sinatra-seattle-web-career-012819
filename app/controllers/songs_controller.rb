class SongsController < ApplicationController
  set :views, 'app/views/songs'

  get '/songs' do
    @songs = Song.all

    erb :index
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :show
  end

end
