class PersonalDetailsController < InheritedResources::Base

  private

    def personal_detail_params
      params.require(:personal_detail).permit(:phone_number, :email, :gender, :dob, :marital_status, :blood_group, :image)
    end

end
