class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :player, index: true
      t.belongs_to :team, index: true
      t.belongs_to :stat_definition, index: true
      t.integer :season
      t.integer :stint
      t.float :value

      t.timestamps
    end
  end
end
