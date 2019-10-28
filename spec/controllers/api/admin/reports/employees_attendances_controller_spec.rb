require 'rails_helper'

describe Api::Admin::Reports::EmployeesAttendancesController, type: :controller do
  let!(:admin) { create :user, :with_employees }
  let(:params) {
    { 
      pivot_date: DateTime.now,
      date_word_range: "week"
    }
  }

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    sign_in admin
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: params
      expect(response).to have_http_status(:success)
      attendances_by_day = JSON.parse(response.body).first
      expect(attendances_by_day).to have_key "id"
      expect(attendances_by_day).to have_key "name"
      expect(attendances_by_day).to have_key "email"
      expect(attendances_by_day).to have_key "attendances"
      expect(attendances_by_day["attendances"].first["attendances"].size).to eq 2
    end
  end
  
  describe "GET #index unauthorized" do
    it "returns http success" do
    sign_out admin
    sign_in admin.employees.first
      get :index, params: params
      expect(response.status).to eq 401
    end
  end
end
