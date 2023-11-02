require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:valid_attributes) {
    { company_name: 'tata', min_salary: 50, max_salary: 250, address: "indore", city: "indore", image: "abc" }
    }

  describe "GET #index" do
    it "returns a 200 OK response" do
      get :index
      expect(response).to have_http_status(200)
    end  
  end
   
  describe "GET #show" do
    it "returns a 200 OK response" do
      job = Job.create! valid_attributes
      get :show, params: {id: job.to_param}
      expect(response).to have_http_status(200)
    end
  end

  describe "Post #create" do
    it "returns a 201 created response" do
      post :create
      job = Job.create! valid_attributes
      expect(response).to have_http_status(201)
    end
  end


  describe "put #update" do
    it "returns a 200 OK response" do
      job = Job.create! valid_attributes
      patch :update, params: {id: job.to_param}
      expect(response).to have_http_status(200)
    end
  end


  describe "delete #destroy" do
    it "returns a 200 OK response" do
      job = Job.create! valid_attributes
      delete :destroy, params: {id: job.to_param}
      expect(response).to have_http_status(204)
    end
  end



end
