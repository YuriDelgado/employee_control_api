require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { create :user, :with_employees }
  let(:valid_params) do
    { status: "check_in", note: "", user: user.employees.first }
  end

  describe "valid params" do
    subject { described_class.new(valid_params) }

    it "should be valid with valid params" do
      expect(subject).to be_valid
    end

    it "valid only for described statuses" do
      subject.status = %w(check_in check_out lunch company_errand personal_errand emergency other).sample
      expect(subject).to be_valid
    end
  end
  
  describe "not valid parms" do
    let(:params) do
      { status: nil }
    end
    subject { described_class.new(params) }

    it "if status is nil" do
      expect(subject).to_not be_valid
    end

    it "invalid status raise an error" do
      expect { build(:attendance, status: :not_valid) }
        .to raise_error(ArgumentError)
        .with_message (/'not_valid' is not a valid status/)
    end
  end
end
