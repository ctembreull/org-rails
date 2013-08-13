class CreateStatDefinitions < ActiveRecord::Migration
  def change
    create_table :stat_definitions do |t|
      t.string :code
      t.string :name
      t.string :abbr
      t.boolean :raw
      t.string :category
      t.string :definition
      t.string :format

      t.timestamps
    end
  end
end
