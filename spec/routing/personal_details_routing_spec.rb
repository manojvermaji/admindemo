require "rails_helper"

RSpec.describe PersonalDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/personal_details").to route_to("personal_details#index")
    end

    it "routes to #new" do
      expect(get: "/personal_details/new").to route_to("personal_details#new")
    end

    it "routes to #show" do
      expect(get: "/personal_details/1").to route_to("personal_details#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/personal_details/1/edit").to route_to("personal_details#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/personal_details").to route_to("personal_details#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/personal_details/1").to route_to("personal_details#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/personal_details/1").to route_to("personal_details#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/personal_details/1").to route_to("personal_details#destroy", id: "1")
    end
  end
end
