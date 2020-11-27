class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :seller_id
      t.integer :product_id
      t.integer :quantity
      t.integer :customer_id
      t.string :adress
    end
  end
end
