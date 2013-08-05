class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :franchise, index: true
      t.string :abbr
      t.string :city
      t.string :name

      t.timestamps
    end
  end
end
