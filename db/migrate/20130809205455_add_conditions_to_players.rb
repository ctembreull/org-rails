class AddConditionsToPlayers < ActiveRecord::Migration
  def change
		add_column :players, :dfa, :boolean, default: false
  end
end
