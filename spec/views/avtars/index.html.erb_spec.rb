require 'rails_helper'

RSpec.describe "avtars/index", type: :view do
  before(:each) do
    assign(:avtars, [
      Avtar.create!(),
      Avtar.create!()
    ])
  end

  it "renders a list of avtars" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
