class Mp3tune < ActiveRecord::Base

  #associations
  has_many :ratings

  #validations
  validates_presence_of :url
  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :length
  validates_numericality_of :length

  def rating_value
    self.ratings.inject(0){|sum,r| sum += r.value}
  end


end
