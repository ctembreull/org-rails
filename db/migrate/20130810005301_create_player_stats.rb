class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
