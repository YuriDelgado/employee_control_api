class AdminController < ApplicationController
  before_action :admin_only!

  private
    def admin_only!
      render json: { status: :unauthorized, messaage: "Only admin user allowed." }, status: 401 unless current_user.admin?
    end
end