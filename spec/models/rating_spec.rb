require 'spec_helper'

describe Rating do

  subject {Factory(:rating)}
  it {should be_valid}

  #associations
  it {should respond_to :mp3tune}
  it {should belong_to :mp3tune}


  #validations
  it {should validate_presence_of :value}
  it {should validate_presence_of :mp3tune}
  it {should validate_numericality_of :value}
  #it {should validate_inclusion_of :value, :in=> 1..5}
end
