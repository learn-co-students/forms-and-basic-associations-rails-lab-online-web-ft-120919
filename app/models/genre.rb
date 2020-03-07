class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
end
=begin
Genre
has a name attribute (String)
has many songs
=end