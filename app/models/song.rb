class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    self.name.gsub(/\s/,'-')
  end

  def self.find_by_slug(slug)
    song_name = slug.gsub('-',' ')
    Song.all.find{|song| song.name == song_name}
  end
end
