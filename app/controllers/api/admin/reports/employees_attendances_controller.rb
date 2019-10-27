class Api::Admin::Reports::EmployeesAttendancesController < AdminController
  def index
    @employees = current_user.employees_attendances_by_date_range(date_range_from_params)
    return render json: @employees
  end

  private
  def date_range_from_params
    pivot_date = params[:pivot_date] || DateTime.yesterday
    date_word_range = params[:date_word_range] || "day"
    pivot_date.to_datetime.send("all_#{date_word_range}")
  end
end