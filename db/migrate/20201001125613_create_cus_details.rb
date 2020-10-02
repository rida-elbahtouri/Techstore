class CreateCusDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cus_details do |t|
      t.integer :customer_id
      t.string :adress
    end
  end
end
