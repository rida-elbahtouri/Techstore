class CreateSelDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :sel_details do |t|
      t.integer :customer_id
      t.string :shipping_adress
      t.string :product_type
    end
  end
end
