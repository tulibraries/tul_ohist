require "rails_helper"

RSpec.describe PhotographsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/photographs").to route_to("photographs#index")
    end

    it "routes to #new" do
      expect(:get => "/photographs/new").to route_to("photographs#new")
    end

    it "routes to #show" do
      expect(:get => "/photographs/1").to route_to("photographs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/photographs/1/edit").to route_to("photographs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/photographs").to route_to("photographs#create")
    end

    it "routes to #update" do
      expect(:put => "/photographs/1").to route_to("photographs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/photographs/1").to route_to("photographs#destroy", :id => "1")
    end

  end
end
