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
  validates :body, :answers, :correct_answers, :explanation,
             :documentation_id, :answer_counter, :positive_rates,
             :negative_rates, presence: true

end
