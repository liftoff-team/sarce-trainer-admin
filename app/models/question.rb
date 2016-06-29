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

class Question < ApplicationRecord
  belongs_to :documentation
  validates :body,
            :answers,
            :correct_answers,
            :explanation,
            :documentation_id,
            :answer_counter,
            :positive_rates,
            :negative_rates, presence: true
  validates :correct_answers, length: { minimum: 1 }

  before_save :convert_correct_answers

  # TODO : (fabienalbi) maybe call the service from the controller
  def correct_count
    QuestionService.new(self).find_correct_count
  end

  # TODO : (fabienalbi) maybe move the below 3 methods into the presenter
  def correct_ratio
    answer_counter == 0 ? 0.to_f : correct_count.to_f / answer_counter
  end

  def total_rates
    positive_rates + negative_rates
  end

  def like_ratio
    total_rates == 0 ? 0.to_f : positive_rates.to_f / total_rates
  end

  def convert_correct_answers
    correct_answers.map! { |index| answers[index.to_i] }
  end
end
