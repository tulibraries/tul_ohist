require "rails_helper"

RSpec.describe TranscriptsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/transcripts").to route_to("transcripts#index")
    end

    it "routes to #new" do
      expect(:get => "/transcripts/new").to route_to("transcripts#new")
    end

    it "routes to #show" do
      expect(:get => "/transcripts/1").to route_to("transcripts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/transcripts/1/edit").to route_to("transcripts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/transcripts").to route_to("transcripts#create")
    end

    it "routes to #update" do
      expect(:put => "/transcripts/1").to route_to("transcripts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/transcripts/1").to route_to("transcripts#destroy", :id => "1")
    end

  end
end
