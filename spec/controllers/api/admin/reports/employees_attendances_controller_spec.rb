require 'rails_helper'

RSpec.describe Api::Admin::Reports::EmployeesAttendancesController, type: :controller do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    sign_in create :user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
