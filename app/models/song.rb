class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes 
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil 
  end 

#   def genre_name=(name)
#     self.genre = Genre.find_or_create_by(name: name)
#   end 

#   def genre_name
#     self.genre ? self.genre.name : nil 
#   end 

#   def song_notes=(notes)
#     notes.each do |note|
#       if note.empty? 
#         self.notes << Note.create(note: note)
#       end 
#     end 
#   end 
  
#   def song_notes
#     self.notes.collect(&:content)
#   end 
end
