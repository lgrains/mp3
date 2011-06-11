class Mp3tune < ActiveRecord::Base

  #associations
  has_many :ratings, :dependent => :destroy
  has_and_belongs_to_many :playlists

  #validations
  validates_presence_of :url
  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :length
  validates_numericality_of :length

  def rating_value
    total = self.ratings.inject(0){|sum,r| sum += r.value}
    self.ratings.size == 0 ? 0 : total.to_f/self.ratings.size
  end


end
