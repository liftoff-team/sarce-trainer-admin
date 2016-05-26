# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  body             :string
#  answers          :text
#  correct_answers  :text
#  explanation      :text
#  documentation_id :integer
#  answer_counter   :integer          default("0")
#  positive_rates   :integer          default("0")
#  negative_rates   :integer          default("0")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

describe Question do
  FactoryGirl.create_list(:documentation, 5)
  let(:question) { build(:question) }

  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:answers) }
    it { should validate_presence_of(:correct_answers) }
    it { should validate_presence_of(:explanation) }
    it { should validate_presence_of(:documentation_id) }
    it { should validate_presence_of(:answer_counter) }
    it { should validate_presence_of(:positive_rates) }
    it { should validate_presence_of(:negative_rates) }
  end

  describe 'association' do
    it { should belong_to(:documentation) }
  end
end
