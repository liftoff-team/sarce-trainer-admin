require 'rails_helper'

RSpec.describe Documentation do
  subject { build(:documentation) }

  describe 'validations' do
    it { is_expected.to be_valid } # test that factory is valid

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:short_name) }
    it { is_expected.to validate_presence_of(:cover_path) }
  end
end
