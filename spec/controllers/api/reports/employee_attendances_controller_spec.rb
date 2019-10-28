require 'rails_helper'

RSpec.describe Api::Reports::EmployeeAttendancesController, type: :controller do
  let(:admin) { create :user, :with_employees  }
  let(:employee) { admin.employees.last }
  let(:params) {
    {
      pivot_date: DateTime.now,
      date_word_range: 'week'
    }
  }

  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    sign_in employee
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: params
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['attendances'].size).to eq 2
    end
  end
end
