require "rails_helper"

RSpec.describe AvtarsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/avtars").to route_to("avtars#index")
    end

    it "routes to #new" do
      expect(get: "/avtars/new").to route_to("avtars#new")
    end

    it "routes to #show" do
      expect(get: "/avtars/1").to route_to("avtars#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/avtars/1/edit").to route_to("avtars#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/avtars").to route_to("avtars#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/avtars/1").to route_to("avtars#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/avtars/1").to route_to("avtars#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/avtars/1").to route_to("avtars#destroy", id: "1")
    end
  end
end
