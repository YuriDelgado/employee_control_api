class Attendance < ApplicationRecord
  belongs_to :user

  enum status: [:check_in, :check_out, :lunch, :company_errand, :personal_errand, :emergency, :other]
  
end
