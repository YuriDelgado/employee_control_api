require 'rails_helper'

RSpec.describe Api::Reports::EmployeeAttendancesController, type: :controller do
  let(:admin) { create :user  }
  let(:employee) { create :user, role: :employee, admin: admin }

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    sign_in employee
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
