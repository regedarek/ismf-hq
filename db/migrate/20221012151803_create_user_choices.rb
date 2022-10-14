class CreateUserChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_choices do |t|
      t.belongs_to :answer, null: false, foreign_key: true
      t.belongs_to :user_answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
