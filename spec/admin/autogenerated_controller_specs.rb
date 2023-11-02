
# ActiveAdmin.application.namespaces[:admin].resources.each do |resource|
#   resource_name = resource.resource_name
#   resource_title = resource_name.human.titleize
#   has_factory = FactoryBot.factories.any? do |factory|
#     factory.name.to_s == resource_name.singular
#   end

#   RSpec.describe resource.controller, type: :controller do
#     let!(:user) { create(:user, :admin) }
#     let(:page) { Capybara::Node::Simple.new(response.body) }
#     let!(:model) do
#       create(resource_name.singular) if has_factory
#     end

#     render_views

#     before(:each) { sign_in user }

#     it 'renders the index page' do
#       get :index
#       expect(page).to have_content(resource_title)
#       if model
#         show_path = send("admin_#{resource_name.singular}_path", model)
#         expect(page).to have_link(model.id, href: show_path)
#       end
#     end

#     if has_factory
#       it 'renders the show page' do
#         get :show, params: { id: model.to_param }
#         expect(page).to have_content("#{resource_title} Details")
#         expect(page).to have_content(model.name) if model.respond_to?(:name)
#       end
#     end
#   end
# end


require 'rails_helper'

RSpec.describe 'PersonalDetails Admin', type: :feature do
  let(:admin_user) { create(:admin_user) }

  before do
    login_as admin_user, scope: :admin_user
  end

  describe 'New PersonalDetail Form' do
    it 'creates a new PersonalDetail with valid data' do
      visit new_admin_personal_detail_path
      fill_in 'Phone Number', with: '1234567890'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Email', with: ''
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Email', with: 'test@example.com'

      # Fill in other fields as needed

      click_button 'Create Personal detail'
      expect(page).to have_content('Personal detail was successfully created.')
    end

    it 'shows validation errors for invalid data' do
      visit new_admin_personal_detail_path

      click_button 'Create Personal detail'
      expect(page).to have_content("Phone number can't be blank")
      expect(page).to have_content("Email can't be blank")
      # Add more validation error checks for other fields as needed
    end
  end


  describe 'Filters' do
    it 'filters records by phone number' do
      create(:personal_detail, phone_number: '1234567890')
      create(:personal_detail, phone_number: '9876543210')

      visit admin_personal_details_path
      fill_in 'q_phone_number_cont', with: '1234567890'
      click_button 'Filter'

      expect(page).to have_content('1234567890')
      expect(page).not_to have_content('9876543210')
    end

    # Add similar tests for other filters
  end

  describe 'Show Page' do
    let!(:personal_detail) { create(:personal_detail, phone_number: '1234567890', email: 'test@example.com') }

    it 'displays the personal detail information' do
      visit admin_personal_detail_path(personal_detail)

      expect(page).to have_content('1234567890')
      expect(page).to have_content('test@example.com')
      # Add expectations for other fields as needed
    end
  end
end



# # spec/admin/personal_details_admin_spec.rb
# require 'rails_helper'

# RSpec.describe 'PersonalDetails Admin', type: :feature do
#   let(:admin_user) { create(:admin_user) }
#   let(:personal_detail) { create(:personal_detail) }

#   before do
#     login_as admin_user, scope: :admin_user
#   end

#   describe 'Index Page' do
#     it 'displays the list of personal details' do
#       visit admin_personal_details_path
#       expect(page).to have_content('Personal Details')
#       # Add more expectations as needed
#     end
#   end

#   describe 'New PersonalDetail Form' do
#     it 'creates a new PersonalDetail with valid data' do
#       visit new_admin_personal_detail_path
#       # Fill in the form fields and submit
#       fill_in 'personal_detail_phone_number', with: '1234567890'
#       fill_in 'personal_detail_email', with: 'test@example.com'
#       fill_in 'personal_detail_gender', with: 'Male'
#       # Add more fields as needed
#       click_button 'Create Personal detail'
#       expect(page).to have_content('Personal detail was successfully created.')
#     end

#     # Add more tests for form validation and error cases as needed
#   end

#   describe 'Edit PersonalDetail Form' do
#     it 'updates a PersonalDetail with valid data' do
#       visit edit_admin_personal_detail_path(personal_detail)
#       # Fill in the form fields with updated data and submit
#       fill_in 'personal_detail_phone_number', with: '9876543210'
#       fill_in 'personal_detail_email', with: 'updated@example.com'
#       # Add more fields as needed
#       click_button 'Update Personal detail'
#       expect(page).to have_content('Personal detail was successfully updated.')
#     end

#     # Add more tests for form validation and error cases as needed
#   end

#   describe 'Show Page' do
#     it 'displays the personal detail information' do
#       visit admin_personal_detail_path(personal_detail)
#       expect(page).to have_content('Phone Number: ' + personal_detail.phone_number)
#       expect(page).to have_content('Email: ' + personal_detail.email)
#       # Add more expectations for other fields as needed
#     end
#   end
# end
