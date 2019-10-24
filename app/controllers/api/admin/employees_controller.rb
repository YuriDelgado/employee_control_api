class Api::Admin::EmployeesController < AdminController
  def index
    @employees = current_user.employees
  end
end
