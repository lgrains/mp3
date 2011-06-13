require "spec_helper"

describe Mp3tunesController do
  describe "routing" do

    it "routes to #index" do
      get("/mp3tunes").should route_to("mp3tunes#index")
    end

    it "routes to #new" do
      get("/mp3tunes/new").should route_to("mp3tunes#new")
    end

    # it "routes to #show" do
    #   get("/mp3tunes/1").should route_to("mp3tunes#show", :id => "1")
    # end

    # it "routes to #edit" do
    #   get("/mp3tunes/1/edit").should route_to("mp3tunes#edit", :id => "1")
    # end

    it "routes to #create" do
      post("/mp3tunes").should route_to("mp3tunes#create")
    end

    # it "routes to #update" do
    #   put("/mp3tunes/1").should route_to("mp3tunes#update", :id => "1")
    # end

    it "routes to #destroy" do
      delete("/mp3tunes/1").should route_to("mp3tunes#destroy", :id => "1")
    end

  end
end
