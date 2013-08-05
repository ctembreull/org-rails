class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :franchise, index: true
			t.belongs_to :league, index: true
      t.string :abbr, limit: 3
      t.string :city
      t.string :name

      t.timestamps
    end
  end
end
