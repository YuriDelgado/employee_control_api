class Api::Admin::EmployeesController < AdminController
  before_action :set_employee, only: [:show, :update]
  before_action :set_defaults_params, only: [:create, :update]

  def index
    @employees = current_user.all_employees
    return render json: @employees, each_serializer: EmployeeSerializer
  end

  def show
  end

  def create
    @employee = current_user.employees.create(employee_params)
    return render json: @employee, serializer: EmployeeSerializer
  end

  def update
    @employee.update(employee_params)
    return render json: @employee, serializer: EmployeeSerializer

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
