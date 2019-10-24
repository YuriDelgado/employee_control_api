require 'rails_helper'


describe AttendancesController, type: :controller do
  describe "POST #create" do
    let(:admin) { create :user, :with_employees } 
    let(:params) { {user_id: admin.employees.first.id, attendance: {status: :check_in, note: "created"}} } 

    before do
      sign_in admin
    end

    it "returns http ok" do
      post :create, params: params, session: {}
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe "PUT #update" do
    let(:admin) { create :user, :with_employees }
    let(:employee) { admin.employees.last }
    let(:attendance) { employee.attendances.first }
    let(:params) do
      { user_id: employee.id,
        attendance: {
          id: attendance.id,
          status: 2,
          note: "updated"
        }
      }
    end
    let(:url) { "/users/#{employee.id}/attendances/#{attendance.id}" }

    before do
      attendance.save!
      sign_in admin
    end

    xit "returns http ok" do
      put url, params: params
      expect(response).to have_http_status(:ok)
    end
  end
end
