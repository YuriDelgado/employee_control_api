class Admin::EmployeesController < ApplicationController
  def index
    @employees = current_user.employees
  end
end
