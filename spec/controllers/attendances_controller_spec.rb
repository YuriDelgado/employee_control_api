require 'rails_helper'


describe Api::Admin::AttendancesController, type: :controller do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "POST #create" do
    let(:admin) { create :user, :with_employees } 
    let(:employee) { admin.employees.first }
    let(:params) { {employee_id: employee.id, attendance: {status: :check_in, note: "created"}} } 


    before do
      sign_in admin
    end

    it "returns http ok" do
      post :create, params: params
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe "PUT #update" do
    let(:admin) { create :user, :with_employees }
    let(:employee) { admin.employees.last }
    let(:attendance) { employee.attendances.first }
    let(:params) do
      { employee_id: employee.id,
        attendance: {
          id: attendance.id,
          status: 2,
          note: "updated"
        }
      }
    end
    let(:url) { "/api/admin/employees/#{employee.id}/attendances/#{attendance.id}" }

    before do
      sign_in admin
    end

    xit "returns http ok" do
      put :update, params: params
      expect(response).to have_http_status(:ok)
    end
  end
end
