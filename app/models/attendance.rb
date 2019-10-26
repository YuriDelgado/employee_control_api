class Attendance < ApplicationRecord
  before_save :set_diff_in_seconds, if: :persisted?

  belongs_to :user

  default_scope ->{ order(created_at: :asc) }

  enum status: [:check_in, :check_out, :lunch, :company_errand, :personal_errand, :emergency, :other]
  

  def created_at_to_date_criteria
    created_at.to_date.to_s
  end

  private
  def set_diff_in_seconds
    self.diff_in_seconds = (updated_at - created_at).to_i
  end
end
