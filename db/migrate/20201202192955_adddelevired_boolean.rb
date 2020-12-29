class AdddeleviredBoolean < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivered, :boolean, default: false
  end
end
