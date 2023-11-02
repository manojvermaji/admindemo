require 'rails_helper'

RSpec.describe "avtars/new", type: :view do
  before(:each) do
    assign(:avtar, Avtar.new())
  end

  it "renders new avtar form" do
    render

    assert_select "form[action=?][method=?]", avtars_path, "post" do
    end
  end
end
