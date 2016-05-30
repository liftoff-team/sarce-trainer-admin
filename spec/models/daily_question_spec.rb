require 'rails_helper'

RSpec.describe DailyQuestion do
  subject { build(:daily_question) }

  describe 'validations' do
    it { should be_valid }

    it { should validate_presence_of(:question_id) }
    it { should validate_presence_of(:answer_counter) }
    it { should validate_presence_of(:scheduled_at) }
    it { should validate_uniqueness_of(:scheduled_at) }
  end

  describe 'association' do
    it { should belong_to(:question) }
  end
end
