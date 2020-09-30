class CreateBasket < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.integer :user_id
      t.integer :product_id
    end
  end
end
