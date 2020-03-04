class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  accepts_nested_attributes_for :notes, :reject_if => proc {|attrs| attrs[:content].blank?}

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(n)
    self.artist = Artist.find_or_create_by(name: n)
  end

end
