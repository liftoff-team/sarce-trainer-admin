require 'rails_helper'

RSpec.describe DailyQuestion do
  subject { build(:daily_question) }

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:question_id) }
    it { is_expected.to validate_presence_of(:answer_counter) }
    it { is_expected.to validate_presence_of(:scheduled_at) }
    it { is_expected.to validate_uniqueness_of(:scheduled_at) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:question) }
  end
end
