# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  body             :string
#  answers          :text             default("{}"), is an Array
#  correct_answers  :text             default("{}"), is an Array
#  explanation      :text
#  documentation_id :integer
#  answer_counter   :integer          default("0")
#  positive_rates   :integer          default("0")
#  negative_rates   :integer          default("0")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Question do
  subject(:question) { build(:question) }

  describe 'validations' do
    it { is_expected.to be_valid }

    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:answers) }
    it { is_expected.to validate_presence_of(:correct_answers) }
    it { is_expected.to validate_presence_of(:explanation) }
    it { is_expected.to validate_presence_of(:documentation_id) }
    it { is_expected.to validate_presence_of(:answer_counter) }
    it { is_expected.to validate_presence_of(:positive_rates) }
    it { is_expected.to validate_presence_of(:negative_rates) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:documentation) }
  end

  describe 'attributes' do
    it { expect(question.answers).to include(*question.correct_answers) }
  end
end
