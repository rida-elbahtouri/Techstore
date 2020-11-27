class RenameTypeToCatag < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :type, :categ
  end
end
