class CreateDailyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_questions do |t|
      t.integer :question_id
      t.integer :answer_counter, default: 0
      t.date :scheduled_at

      t.timestamps
    end
  end
end
