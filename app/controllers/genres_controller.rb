class GenresController < ApplicationController
  set :views, 'app/views/genres'

  get '/genres' do
    @genres = Genre.all

    erb :index
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :show
  end

end
