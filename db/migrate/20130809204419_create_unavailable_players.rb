class CreateUnavailablePlayers < ActiveRecord::Migration
  def change
    create_table :unavailable_players do |t|
      t.belongs_to :franchise, index: true
      t.references :player, index: true
      t.integer :year
      t.integer :length
      t.date :start_date
      t.date :end_date
      t.text :reason

      t.timestamps
    end
  end
end
