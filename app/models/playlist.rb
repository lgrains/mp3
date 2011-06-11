class Playlist < ActiveRecord::Base

  #associations
  has_many :mp3tunes, :through => :playouts
end
