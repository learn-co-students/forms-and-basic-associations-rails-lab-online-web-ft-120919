class Artist < ActiveRecord::Base
  # add associations here
  has_many :songs
end
=begin
Artist
has a name attribute (String)
has many Songs
Song
has a title attribute (String)
belongs to an Artist
belongs to a Genre
has many Notes
Genre
has a name attribute (String)
has many songs
Note
has content attribute (String)
belongs to a Song
=end
