# == Schema Information
#
# Table name: given_answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  answers     :text             default("{}"), is an Array
#  is_correct  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class GivenAnswer < ApplicationRecord
  belongs_to :question
  validates :question_id, :user_id, :answers, :is_correct, presence: true
end
