class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.float :average
      t.integer :hr
      t.integer :rbi
      t.integer :runs
      t.integer :sb
      t.float :ops

      t.timestamps null: false
    end
  end
end
