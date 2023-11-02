require 'rails_helper'

RSpec.describe "avtars/show", type: :view do
  before(:each) do
    assign(:avtar, Avtar.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
