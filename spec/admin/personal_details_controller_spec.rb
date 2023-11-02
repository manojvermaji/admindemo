require 'rails_helper'
RSpec.describe Admin::PersonalDetailsController, type: :controller do
  # render_views
  let(:admin_user) { AdminUser.create(email: 'admin1@admin.com', password: '123123') }

  before do
    sign_in admin_user 
    @personal_detail = PersonalDetail.create(phone_number:"9171119804",email:"mktop03@gmail.com",gender:"m",dob:"12-12-1998",marital_status:"single",image: @image, hobbies:"sport", work_experiences:"1 year", education:"ilitrate")
  end

  describe "create personal details" do
    it "will create personal details" do
      post :create, params: {personal_detail: @personal_detail }
      expect(response.status).to eq(302)  
    end
  end


  describe 'Index Page' do
    it 'displays the list of personal details' do
      get :index, params: {personal_detail: @personal_detail} 
      expect(response.status).to eq(200)
    end
  end

  describe 'show Page' do
    it 'renders the show page' do
      get :show, params: { id: @personal_detail.id }
      expect(response).to have_http_status(200)
    end
  end

end
