require 'rails_helper'

describe UserSerializer, type: :serializer do
  let!(:user) { build :user }
  let!(:serializer) { UserSerializer.new(user) } 
  let!(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  
  subject { JSON.parse(serialization.to_json) }

  it 'should have a email param to match' do
    expect(subject['email']).to eq user.email
    expect(subject['name']).to eq user.name
    expect(subject).to have_key "attendances"
  end
end