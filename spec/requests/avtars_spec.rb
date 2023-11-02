require 'rails_helper'

RSpec.describe "Avtars", type: :request do
 
  before(:each) do
    image_path = Rails.root.join('spec','fixtures','ee.jpeg')
    @image = fixture_file_upload(image_path, 'ee/jpeg')
  end
  

  describe "POST /create" do
    it "returns a created response" do
      # images = ['a.jpeg', 'b.png']  
      post '/avtars', params: { images: @image}
      expect(response).to have_http_status(201)
    end
  end
end


# BCLoQI0BzmjMgeZTcRQsW5rH7Q4vQ2w0UdWOJYt_cNHS2b9lDCxGfE3W6A9puc_MlyUAcHncBHeKAZ57xfbbf2Q
#push key