require 'rails_helper'

RSpec.describe Api::Admin::EmployeesController, type: :controller do
  let(:admin) { create :user, :with_employees }
  let(:employee) { admin.employees.first }

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
    sign_in admin
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:params) {
      { id: employee.id }
    }
    it "returns http success" do
      get :show, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    let(:params) {
      { id: employee.id,
        employee: {
        name: "John Doe"
        }
      }
    }
    it "returns http success" do
      put :update, params: params
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST #create" do
    let(:params) {
      { employee: {
        email: "example@test.com",
        password: "123qwe",
        admin: admin,
        role: :employee
        }
      }
    }
    it "returns http success" do
      post :create, params: params
      expect(response).to have_http_status(:success)
    end
  end

end
