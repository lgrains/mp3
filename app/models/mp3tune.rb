class Mp3tune < ActiveRecord::Base

  #associations
  has_many :ratings,
    :dependent => :destroy

  #validations
  validates_presence_of :url
  validates_presence_of :title
  validates_presence_of :artist
  validates_presence_of :length
  validates_numericality_of :length

  def average_rating
    ratings.average(:value).to_f
  end

  def self.random_by_artist(mp3_id)
    artist = Mp3tune.find(mp3_id).artist
    self.where('artist = ?', artist).sort_by {rand}[0..Mp3tune.all.size]
  end

  def self.random_by_min_rating(rating)
    tune_list = self.all.sort_by {rand}[0..Mp3tune.all.size]
    tune_list.inject([]){|arr,tune| arr << tune if tune.average_rating >= rating; arr}
  end

end

