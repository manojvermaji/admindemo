require 'rails_helper'

RSpec.describe "EmployeeAttendances", type: :request do
  
  before do
    @employee = FactoryBot.create(:employee)
  end

  let(:valid_attributes) { 
    { date: '2023-10-10', attendance: "present", mode_of_work: "wfo", employee_id: @employee.id }
  }
    
  let (:attribute){
    { start_date: '2023-10-01', end_date: '2023-10-10', employee_id: @employee.id }
  } 

    describe "POST #create" do
      it "returns  a 200 OK response" do
        post '/employee_attendances', params: { date: '2023-10-10', attendance: "present", mode_of_work: "wfo", employee_id: @employee.id }
        expect(response).to have_http_status(200)
      end
    end

  describe "POST #calculate_hours" do
    it "returns JSON with calculated hours" do
      start_date = Date.parse('2023-10-01')
      end_date = Date.parse('2023-10-31')
      @employee = FactoryBot.create(:employee)
      FactoryBot.create(:employee_attendance, date: '2023-10-01', attendence: 'present', mode_of_work: 'wfo', working_hours: 8, employee: @employee.id)
      FactoryBot.create(:employee_attendance, date: '2023-10-02', attendence: 'present', mode_of_work: 'wfh', working_hours: 4, employee: @employee.id)
      FactoryBot.create(:employee_attendance, date: '2023-10-03', attendence: 'present', mode_of_work: 'wfo', working_hours: 9, employee: @employee.id)
      FactoryBot.create(:employee_attendance, date: '2023-10-04', attendence: 'absent', mode_of_work: 'wfo', working_hours: 0, employee: @employee.id)

      get :calculate_hours, params: { start_date: '2023-10-01', end_date: '2023-10-31', employee_id: @employee.id }

      expect(response).to have_http_status(200)

      json_response = JSON.parse(response.body)
      expect(json_response["office_hours"]).to eq(17) # Total office hours
      expect(json_response["wfh_hours"]).to eq(4)     # Total work from home hours
      expect(json_response["total_hours"]).to eq(21)   # Total working hours
    end
  end


end


# blood group dropdown 