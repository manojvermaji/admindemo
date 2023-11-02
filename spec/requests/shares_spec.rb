require 'rails_helper'

RSpec.describe "Shares", type: :request do
  let(:valid_attributes) {
    { description: 'tata', image: 'a.jpeg', video: 'b.mp4', audio_data: "c.mp3", document: "x.pdf" }
    }
  

  before(:each) do
    image_path = Rails.root.join('spec','fixtures','ee.jpeg')
    @image = fixture_file_upload(image_path, 'ee/jpeg')
  end
      
      describe "POST /create" do
          it "returns a created response" do
            post '/shares', params: { description: 'tata', image: @image } 
            expect(response).to have_http_status(201)
        end
      end
        
 
end


