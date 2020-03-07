class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song
end
=begin
Note
has content attribute (String)
belongs to a Song
=end
