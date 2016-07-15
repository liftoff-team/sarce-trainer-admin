class AddAuthorToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :author_id, :integer
    add_index :questions, :author_id
  end
end
