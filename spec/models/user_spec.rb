require 'rails_helper'

describe User do
  let(:user) { create(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'creates an user with valid data' do
    expect { user }.to change { User.count }.from(0).to(1)
  end

  it 'should validates email presence' do
    user.email = ''
    expect(user).not_to be_valid
  end

  it 'should validates cis presence' do
    user.cis = ''
    expect(user).not_to be_valid
  end
end
