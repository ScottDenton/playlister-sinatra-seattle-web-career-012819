class SongsController < ApplicationController
  set :views, 'app/views/songs'

  get '/songs' do
    @songs = Song.all

    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs/new' do
    @song_name = params[:song_name]
    @artist_name = params[:artist_name]
    @song = Song.new(name: @song_name)
    @song.artist = Artist.find_or_create_by(name: @artist_name)
    @song.save
    genres = params[:genres].each do |genre|
      SongGenre.create(song_id: @song.id, genre_id: genre)
    end
    @slug = @song.slug
    redirect "/songs/#{@slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @slug = @song.slug
    erb :show
  end



end
