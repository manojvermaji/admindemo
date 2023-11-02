require 'rails_helper'

RSpec.describe "avtars/edit", type: :view do
  let(:avtar) {
    Avtar.create!()
  }

  before(:each) do
    assign(:avtar, avtar)
  end

  it "renders the edit avtar form" do
    render

    assert_select "form[action=?][method=?]", avtar_path(avtar), "post" do
    end
  end
end
