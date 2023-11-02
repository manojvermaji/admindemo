require 'rails_helper'

RSpec.describe "personal_details/new", type: :view do
  before(:each) do
    assign(:personal_detail, PersonalDetail.new(
      phone_number: "MyString",
      email: "MyString",
      gender: "MyString",
      dob: "MyString",
      marital_status: "MyString",
      blood_group: "MyString"
    ))
  end

  it "renders new personal_detail form" do
    render

    assert_select "form[action=?][method=?]", personal_details_path, "post" do

      assert_select "input[name=?]", "personal_detail[phone_number]"

      assert_select "input[name=?]", "personal_detail[email]"

      assert_select "input[name=?]", "personal_detail[gender]"

      assert_select "input[name=?]", "personal_detail[dob]"

      assert_select "input[name=?]", "personal_detail[marital_status]"

      assert_select "input[name=?]", "personal_detail[blood_group]"
    end
  end
end
