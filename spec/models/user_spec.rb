require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  describe 'validations' do
    it { is_expected.to be_valid } # test that factory is valid

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:cis) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:rank) }

    it { is_expected.to validate_confirmation_of(:password) }
  end
end
