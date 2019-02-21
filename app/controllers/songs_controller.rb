class SongsController < ApplicationController
  set :views, 'app/views/songs'

  get '/songs' do
    @songs = Song.all
    binding.pry
    erb :index
  end

end
