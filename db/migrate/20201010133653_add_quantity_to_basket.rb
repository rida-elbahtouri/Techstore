class AddQuantityToBasket < ActiveRecord::Migration[6.0]
  def change
    add_column :baskets, :quantity, :integer
  end
end
