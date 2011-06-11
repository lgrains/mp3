class Rating < ActiveRecord::Base

  #associations
  belongs_to :mp3tune

  validates_presence_of :value
  validates_presence_of :mp3tune
  validates_numericality_of :value
  validates_inclusion_of :value, :in => 1..5, :message=>"should be between 1 and 5"


end
