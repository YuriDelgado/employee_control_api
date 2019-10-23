class AttendancesController < ApplicationController
  before_action :authorize!, only: [:create, :update]
  before_action :set_employee, only: [:create, :update]

  def create
    @attendance = @employee.attendances.new(attendance_params)
    if@attendance.save
      render json: { status: :created, message: "Attendance created successfully!", data: @attendance }
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update
    @attendance = Attendance.find(params[:attendance][:id])
    if @attendance.update(attendance_params)
      render json: { status: :ok, message: "Attendance updated successfully!", data: @attendance }
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

private
  def set_employee
    @employee = User.find(params[:user_id])
  end

  def attendance_params
    params.require(:attendance).permit(:id, :note, :status)
  end

  def authorize!
    render json: { status: :unauthorized } unless current_user.admin?
  end
end