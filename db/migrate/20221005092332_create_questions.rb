class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :answer_type, null: false
      t.string :name, null: false
      t.integer :position
      t.integer :question_source_type, null: false
      t.string :question_source_value

      t.timestamps
    end
  end
end
