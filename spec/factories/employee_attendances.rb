FactoryBot.define do
  factory :employee_attendance do
    date { "2023-10-10" }
    attendence { "MyString" }
    mode_of_work { "MyString" }
    working_hours { 1 }
    employee { 4 }
  end
end
