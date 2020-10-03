class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :stars
    end
  end
end
