class Addselletimestoproduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :selletimes, :integer, :default => 0
  end
end
