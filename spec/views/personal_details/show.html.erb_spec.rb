require 'rails_helper'

RSpec.describe "personal_details/show", type: :view do
  before(:each) do
    assign(:personal_detail, PersonalDetail.create!(
      phone_number: "Phone Number",
      email: "Email",
      gender: "Gender",
      dob: "Dob",
      marital_status: "Marital Status",
      blood_group: "Blood Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Dob/)
    expect(rendered).to match(/Marital Status/)
    expect(rendered).to match(/Blood Group/)
  end
end
