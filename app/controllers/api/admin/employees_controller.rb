class Api::Admin::EmployeesController < AdminController
  before_action :set_employee, only: [:show, :update]
  before_action :set_defaults_params, only: [:create, :update]

  def index
    @employees = current_user.employees_attendances_by_date_range (DateTime.now - 4)..(DateTime.now - 2)
    return render json: @employees, include: :attendances
  end

  def show
  end

  def create
    @employee = current_user.employees.create(employee_params)
  end

  def update
    @employee.update(employee_params)
  end

  private
  def set_employee
    @employee = User.find(params[:id])
  end

  def set_defaults_params
    params[:employee][:role] = :employee
  end

  def employee_params
    params.require(:employee).permit(:id, :name, :email, :password, :role)
  end
end
