class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes 

  accepts_nested_attributes_for :notes

  # def genre_name=(name)
  #   self.genre_name = name 
  # end #genre_name=

  # def genre_name
  #   self.genre_name 
  # end #genre_name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end #artist_name=

  def artist_name
    self.artist ? self.artist.name : nil 
  end #artist_name

end
