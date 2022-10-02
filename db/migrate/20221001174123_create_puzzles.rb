class CreatePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :puzzles do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
