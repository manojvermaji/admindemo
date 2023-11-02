json.extract! personal_detail, :id, :phone_number, :email, :gender, :dob, :marital_status, :blood_group, :created_at, :updated_at
json.url personal_detail_url(personal_detail, format: :json)
