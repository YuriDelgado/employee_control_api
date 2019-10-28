class Api::Admin::AttendancesController < AdminController
  before_action :set_employe_and_params, only: :create

  def create
    @attendance = @employee.attendances.new(attendance_params)
    return render json: { errors: @attendance.errors }, status: 422 unless @attendance.valid?
    @attendance.save!
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.update(attendance_params)
  end

private
  def attendance_params
    params.require(:attendance).permit(:id, :note, :status)
  end

  def set_employe_and_params
    params[:attendance][:status] = 0
    @employee = User.find(params[:employee_id])
  end
end
