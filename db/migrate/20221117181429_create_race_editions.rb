class CreateRaceEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :race_editions do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :race_editions, :slug, unique: true
  end
end
