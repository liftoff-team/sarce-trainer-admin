class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.text :answers, array: true, default: []
      t.text :correct_answers, array: true, default: []
      t.text :explanation
      t.integer :documentation_id
      t.integer :answer_counter, default: 0
      t.integer :positive_rates, default: 0
      t.integer :negative_rates, default: 0

      t.timestamps
    end
  end
end
