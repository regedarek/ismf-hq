class AddRaceEditionIdToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :race_edition_id, :bigint
  end
end
