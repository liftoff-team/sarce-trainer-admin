class DailyQuestion < ApplicationRecord
  belongs_to :question
  validates :question_id, :answer_counter, :scheduled_at, presence: true
  validates :scheduled_at, uniqueness: true
end
