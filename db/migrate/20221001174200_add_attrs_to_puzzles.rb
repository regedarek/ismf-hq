class AddAttrsToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_column :puzzles, :en_phrase, :string
    add_column :puzzles, :it_phrase, :string
  end
end
