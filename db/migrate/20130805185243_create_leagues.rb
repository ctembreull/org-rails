class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :abbr, limit: 3
      t.string :name
      t.string :level, limit: 4

      t.timestamps
    end
  end
end
