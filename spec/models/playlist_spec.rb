require 'spec_helper'

describe Playlist do
  subject { Factory(:playlist)}
  it {should be_valid }

  #associations
  it {should have_many :mp3tunes}

end
