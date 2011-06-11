require 'spec_helper'

describe "Mp3tunes" do
  describe "GET /mp3tunes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mp3tunes_path
      response.status.should be(200)
    end
  end
end
