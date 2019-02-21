class SongsController < ApplicationController
  set :views, 'app/views/songs'

  get '/songs' do
    @songs = Song.all

    erb :index
  end

  get '/songs/new' do

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @slug = @song.slug
    erb :show
  end



end
