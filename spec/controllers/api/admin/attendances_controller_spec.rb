require 'rails_helper'


describe Api::Admin::AttendancesController, type: :controller do
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe "POST #create" do
    let(:admin) { create :user, :with_employees } 
    let(:params) { {employee_id: admin.employees.first.id, attendance: {status: :check_in, note: "created"}} } 
    let(:invalid_params) { {employee_id: admin.employees.last.id, attendance: {status: :check_in, note: "error created"}} } 


    before do
      sign_in admin
    end

    it "returns http ok" do
      post :create, params: params
      expect(response).to have_http_status(:ok)
    end

    it "returns http error validating check_in twice in the same time" do
      post :create, params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to have_content "A :check_in attendance is in progress."
    end
  end
  
  describe "PUT #update" do
    let(:admin) { create :user, :with_employees }
    let(:employee) { admin.employees.last }
    let(:attendance) { employee.attendances.first }
    let(:params) do
      { employee_id: employee.id,
        id: attendance.id,
        attendance: {
          id: attendance.id,
          note: "updated"
        }
      }
    end

    before do
      sign_in admin
    end

    it "returns http ok" do
      put :update, params: params
      expect(response).to have_http_status(:ok)
    end
  end
end
