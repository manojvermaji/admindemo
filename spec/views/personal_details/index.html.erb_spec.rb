require 'rails_helper'

RSpec.describe "personal_details/index", type: :view do
  before(:each) do
    assign(:personal_details, [
      PersonalDetail.create!(
        phone_number: "Phone Number",
        email: "Email",
        gender: "Gender",
        dob: "Dob",
        marital_status: "Marital Status",
        blood_group: "Blood Group"
      ),
      PersonalDetail.create!(
        phone_number: "Phone Number",
        email: "Email",
        gender: "Gender",
        dob: "Dob",
        marital_status: "Marital Status",
        blood_group: "Blood Group"
      )
    ])
  end

  it "renders a list of personal_details" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dob".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Marital Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Blood Group".to_s), count: 2
  end
end
