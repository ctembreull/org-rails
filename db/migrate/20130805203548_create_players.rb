class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :franchise, index: true
      t.belongs_to :team, index: true
			t.string :pid, limit: 8
			t.string :first_name
			t.string :last_name
			t.string :bats, limit: 1
			t.string :throws, limit: 1
			t.integer :height
			t.integer :weight
			t.date :birth_date
			t.string :position
			
			t.boolean :on_25, default: false
			t.boolean :on_40, default: false
			t.boolean :on_dl, default: false
			t.boolean :on_bereavement, default: false
			t.boolean :on_paternity, default: false
			t.boolean :suspended, default: false
			t.boolean :retired, default: false
			
      t.timestamps
    end
  end
end
