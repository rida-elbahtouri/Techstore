class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :customer_id
      t.integer :product_id
      t.text :content
    end
  end
end
