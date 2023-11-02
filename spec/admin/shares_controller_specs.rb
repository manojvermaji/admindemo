require 'rails_helper'
RSpec.describe Admin::SharesController, type: :controller do
  let(:admin_user) { AdminUser.create(email: 'admin1@admin.com', password: '123123') }

  before do
    sign_in admin_user 
    # @shares = Share.create(description:"abc",likes_count: 2,image:"a.jpg", video:"b.mp4", document:"c.pdf", audio_data:"d.mp3")
  end

  describe "create shares" do
    it "will create shares" do
      post :create, params: {description:"abc",likes_count: 2,image:"a.jpg", video:"b.mp4", document:"c.pdf", audio_data:"d.mp3"}
      expect(response.status).to eq(302)  
    end
  end


  describe 'Index Page' do
    it 'displays the share' do
      get :index, params: {description:"abc",likes_count: 2,image:"a.jpg", video:"b.mp4", document:"c.pdf", audio_data:"d.mp3"} 
      expect(response.status).to eq(200)
    end
  end

  describe 'show Page' do
    it 'renders the show page' do
      @shares = Share.create(description:"abc",likes_count: 2,image:"a.jpg", video:"b.mp4", document:"c.pdf", audio_data:"d.mp3")
      get :show, params: { id: @shares.id }
      expect(response).to have_http_status(200)
    end
  end

end