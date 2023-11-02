require 'rails_helper'
RSpec.describe Admin::HollydaysController, type: :controller do
  let(:admin_user) { AdminUser.create(email: 'admin1@admin.com', password: '123123') }

  before do
    sign_in admin_user 
    @hollydays = Hollyday.create(start_date:"12-10-23",end_date:"14-10-23", reason:"fever")
  end

  describe "create hollydays" do
    it "will create hollydays" do
      post :create, params: {hollydays: @hollydays }
      expect(response.status).to eq(200)  
    end
  end


  describe 'Index Page' do
    it 'displays the hollydays' do
      get :index, params: {hollydays: @hollydays} 
      expect(response.status).to eq(200)
    end
  end

  describe 'show Page' do
    it 'renders the show page' do
      get :show, params: { id: @hollydays.id }
      expect(response).to have_http_status(200)
    end
  end

end