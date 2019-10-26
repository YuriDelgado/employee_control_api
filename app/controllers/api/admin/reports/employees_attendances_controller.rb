class Api::Admin::Reports::EmployeesAttendancesController < AdminController
  def index
    @employees = current_user.employees_attendances_by_date_range(date_range_from_params)
  end

  private
  def date_range_from_params
    pivot_date = params[:pivot_date] || DateTime.yesterday
    word_range = params[:word_range] || "day"
    pivot_date.to_datetime.send("all_#{word_range}")
  end
end