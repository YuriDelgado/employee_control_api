class Api::Reports::EmployeeAttendancesController < ApplicationController
  include UsersHelper

  def index
    @attendances = current_user.attendances_by_date_range date_range_from_params(params)
    return render json: GroupedAttendancesSerializer.new(@attendances).serialize!
  end
end