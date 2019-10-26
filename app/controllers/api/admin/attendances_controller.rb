class Api::Admin::AttendancesController < AdminController
  before_action :set_employee, only: [:create]

  def create
    @attendance = @employee.attendances.create(attendance_params)
  end

  def update
    @attendance = Attendance.find(params[:attendance][:id])
    @attendance.update(attendance_params)
  end

private
  def set_employee
    @employee = User.find(params[:employee_id])
  end

  def attendance_params
    params.require(:attendance).permit(:id, :note, :status)
  end

end
