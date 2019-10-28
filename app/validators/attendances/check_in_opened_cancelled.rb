module Attendances
  class CheckInOpenedCancelled < ActiveModel::Validator
    def validate(record)
      attendance_open = Attendance.find_by({
        user_id: record.user_id,
        created_at: DateTime.now.all_day,
        status: :check_in
      })
      return unless attendance_open.present?

      message = "A :check_in attendance is in progress."
      record.errors[:attendance_already_open] << message
    end
  end
end