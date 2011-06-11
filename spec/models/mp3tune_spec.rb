require 'spec_helper'

describe Mp3tune do
  subject { Factory(:mp3tune)}
  it {should be_valid }

  #associations
  it {should have_many :ratings}
  it {should respond_to :playlist}

  #validations
  it {should validate_presence_of :url}
  it {should validate_presence_of :title}
  it {should validate_presence_of :artist}
  it {should validate_presence_of :length}
  it {should validate_numericality_of :length}

  describe "#rating_value" do
    before do
      5.times do |i|
        Factory(:rating, :mp3tune => subject, :value => 4)
      end
    end

    it "should equal 4" do
      subject.rating_value.should.eql?(4)
    end

    it "should equal 2.6" do
      (0..2).each do|i|
        subject.ratings[i].value = i+1
      end
      (3..4).each do |i|
        subject.ratings[i].value = i + 1
      end
      subject.rating_value.should.eql?(2.6)
    end


  end
end
