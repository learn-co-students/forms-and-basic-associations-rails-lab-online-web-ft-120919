class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)    
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_content(array)
    array.each do |note|
      if !note.empty?
        self.notes.build(content: note)
      end
    end
  end

  def note_content
    self.notes.map do |note|
      note.content
    end   
  end
end
=begin
Song
has a title attribute (String)
belongs to an Artist
belongs to a Genre
has many Notes
=end