class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.update(artist: Artist.find_or_create_by(name: name))
    self.artist_name
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.update(genre: Genre.find_or_create_by(name: name))
    self.genre_name
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end
end
