class CreateGivenAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :given_answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :answers, array: true, default: []
      t.boolean :is_correct

      t.timestamps
    end

    add_index :given_answers, :question_id
  end
end
