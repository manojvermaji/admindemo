require 'rails_helper'

RSpec.describe "personal_details/edit", type: :view do
  let(:personal_detail) {
    PersonalDetail.create!(
      phone_number: "MyString",
      email: "MyString",
      gender: "MyString",
      dob: "MyString",
      marital_status: "MyString",
      blood_group: "MyString"
    )
  }

  before(:each) do
    assign(:personal_detail, personal_detail)
  end

  it "renders the edit personal_detail form" do
    render

    assert_select "form[action=?][method=?]", personal_detail_path(personal_detail), "post" do

      assert_select "input[name=?]", "personal_detail[phone_number]"

      assert_select "input[name=?]", "personal_detail[email]"

      assert_select "input[name=?]", "personal_detail[gender]"

      assert_select "input[name=?]", "personal_detail[dob]"

      assert_select "input[name=?]", "personal_detail[marital_status]"

      assert_select "input[name=?]", "personal_detail[blood_group]"
    end
  end
end
