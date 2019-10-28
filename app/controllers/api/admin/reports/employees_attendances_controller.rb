class Api::Admin::Reports::EmployeesAttendancesController < AdminController
  include UsersHelper

  def index
    @employees = current_user.employees_attendances_by_date_range date_range_from_params(params)
    return render json: @employees
  end
end