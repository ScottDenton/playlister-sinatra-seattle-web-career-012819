class ArtistsController < ApplicationController
    set :views, 'app/views/artists'

    get '/artists' do
      @artists = Artist.all

      erb :index
    end

    get '/artists/:id' do
      @artist = Artist.find(params[:id])
      erb :show
    end

  end
