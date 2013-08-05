class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :abbr
      t.string :city
      t.string :name

      t.timestamps
    end
  end
end
