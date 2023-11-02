# spec/factories/admin_users.rb

FactoryBot.define do
  factory :admin_user do
    # Define attributes for the admin_user model here
    email { 'admin@example.com' }
    password { 'password123' }
    # Add more attributes as needed
  end
end
