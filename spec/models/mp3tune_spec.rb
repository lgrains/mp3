require 'spec_helper'

describe Mp3tune do
  subject { Factory(:mp3tune)}
  it {should be_valid }

  #associations
  it {should have_many(:ratings).dependent(:destroy)}

  #validations
  it {should validate_presence_of :url}
  it {should validate_presence_of :title}
  it {should validate_presence_of :artist}
  it {should validate_presence_of :length}
  it {should validate_numericality_of :length}

  describe "#random_by_artist" do
    before do
      tune_a = Factory(:mp3tune, :artist => subject.artist)
      tune_b = Factory(:mp3tune)
    end

    it "should return subject and tune_a" do
      arr_with = Mp3tune.random_by_artist(subject.id)
      arr_with.length.should == 2
    end
  end

  describe "#random_by_min_rating" do
    before do
      tune_a = Factory(:mp3tune, :artist => subject.artist)
      tune_b = Factory(:mp3tune)
      Factory(:rating, :mp3tune => subject, :value => 4)
      Factory(:rating, :mp3tune => tune_a, :value => 3)
      Factory(:rating, :mp3tune => tune_b, :value => 2)
    end

    it "should return subject and tune_a" do
      arr = Mp3tune.random_by_min_rating(3)
      arr.length.should == 2
    end
  end
end
