require 'rails_helper'

RSpec.describe GivenAnswer do
  subject { build(:given_answer) }

  describe 'validations' do
    it { is_expected.to be_valid } # test that factory is valid

    it { is_expected.to validate_presence_of(:question_id) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:answers) }
  end

  describe 'association' do
    it { should belong_to(:question) }
  end
end
