class Addimageroproducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :photo, :string
  end
end
