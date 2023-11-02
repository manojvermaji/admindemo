# spec/factories/job.rb
FactoryBot.define do
  factory :job do
    company_name { "Example Company" }
    min_salary { 10000 }
    max_salary { 50000 }
    address { "123 Example St" }
    city { "Example City" }
  end

  # Additional customizations for the :job factory can be added here
end
