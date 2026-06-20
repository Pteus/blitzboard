class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :level, null: false, default: 1
      t.integer :sh, null: false, default: 0
      t.integer :pa, null: false, default: 0
      t.integer :bl, null: false, default: 0
      t.integer :en, null: false, default: 0
      t.integer :sp, null: false, default: 0
      t.integer :at, null: false, default: 0
      t.references :team, foreign_key: { on_delete: :nullify }

      t.timestamps
    end
  end
end
