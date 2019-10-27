class Api::Reports::EmployeeAttendancesController < ApplicationController
  def index
    @attendances = current_user.attendances_by_date_range(date_range_from_params)
    return render json:  { attendances: @attendances }
  end

  private
  def date_range_from_params
    pivot_date = params[:pivot_date] || DateTime.yesterday
    date_word_range = params[:date_word_range] || "day"
    pivot_date.to_datetime.send("all_#{date_word_range}")
  end
end