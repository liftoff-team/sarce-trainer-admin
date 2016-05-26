class CreateDocumentations < ActiveRecord::Migration[5.0]
  def change
    create_table :documentations do |t|
      t.string :name
      t.string :short_name
      t.string :cover_path

      t.timestamps
    end
  end
end
