require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin) { create :user }

  context "User is admin" do
    it "is valid without admin parent" do
      expect(User.new(email: "admin@test.com", password: "123456")).to be_valid
    end
    
    it "is valid without admin parent" do
      expect(User.new(email: "admin@test.com", password: "123456", admin: admin)).to_not be_valid
    end

  end

  context "User is employee" do
    it "is valid with admin parent" do
      expect(User.new(email: "admin@test.com", password: "123456", role: :employee, admin: admin)).to be_valid
    end

    it "is valid with admin parent" do
      expect(User.new(email: "admin@test.com", password: "123456", role: :employee)).to_not be_valid
    end
  end
  
  context "User associations" do
    it "should have admin belongs_to association" do
      employee = User.reflect_on_association(:admin)
      expect(employee.macro).to eq :belongs_to
    end  

    it "should have employee has_many association" do
      admin = User.reflect_on_association(:employees)
      expect(admin.macro).to eq :has_many
    end
  end
end
