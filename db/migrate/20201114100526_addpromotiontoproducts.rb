class Addpromotiontoproducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :promotion, :integer, :default => 0
    
  end
end
