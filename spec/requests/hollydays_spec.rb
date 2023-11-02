require 'rails_helper'

RSpec.describe HollydaysController, type: :controller do

  describe "POST /created" do
    it "returns a 201 created response" do
      post 'create', params: { start_date: '2023-11-11', end_date: '20203-11-12', reason: "nothing" }
      expect(response).to have_http_status(201)
    end
  end



  describe "GET #index" do
    it "returns a 200 OK response" do
      get :index
      expect(response).to have_http_status(200)
    end  
  end

   describe "GET #show" do
     it "returns a 200 OK response" do
      hollydays = Hollyday.create!(start_date: '2023-11-11', end_date: '20203-11-12', reason: "nothing")
       get :show, params: {id: hollydays.to_param}
       expect(response).to have_http_status(200)
     end
   end

   describe "PUT #update" do
    it "returns a 200 OK response" do
      hollydays = Hollyday.create!(start_date: '2023-11-11', end_date: '20203-11-12', reason: "nothing")
      hollydays.update!(start_date: '2023-11-11', end_date: '20203-11-12', reason: "nothing")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE #destroy" do
    it "returns a 204 response" do
      hollydays = Hollyday.create!(start_date: '2023-11-11', end_date: '20203-11-12', reason: "nothing")
      delete :destroy, params: {id: hollydays.to_param}
      expect(response).to have_http_status(204)
    end
  end

end

