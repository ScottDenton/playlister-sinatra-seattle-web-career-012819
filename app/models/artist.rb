class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/\s/,'-')

  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub('-',' ')
    Artist.all.find{|artist| artist.name == artist_name}
  end

end
