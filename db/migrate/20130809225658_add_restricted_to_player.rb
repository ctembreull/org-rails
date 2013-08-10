class AddRestrictedToPlayer < ActiveRecord::Migration
  def change
		add_column :players, :restricted, :boolean, default: false
  end
end
