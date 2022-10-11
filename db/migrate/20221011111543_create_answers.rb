class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.boolean :correct, null: false, default: false
      t.string :name, null: false
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
