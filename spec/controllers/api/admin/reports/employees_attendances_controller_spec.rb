require 'rails_helper'

RSpec.describe Api::Admin::Reports::EmployeesAttendancesController, type: :controller do
  let(:admin) { create :user, :with_employees }
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
    end
  end
end
