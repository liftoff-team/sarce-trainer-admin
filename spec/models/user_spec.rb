# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  last_name              :string           not null
#  first_name             :string           not null
#  cis                    :string           not null
#  rank                   :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
