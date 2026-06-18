class CreateSeasons < ActiveRecord::Migration[8.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.integer :year
      t.boolean :active

      t.timestamps
    end

    add_index :seasons, :active, unique: true, where: "active = true",
      name: "index_seasons_on_active_true"
  end
end
