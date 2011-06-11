class Playlist < ActiveRecord::Base

  #associations
  has_and_belongs_to_many :mp3tunes
end
