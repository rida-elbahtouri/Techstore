class RenameUseridInbasket < ActiveRecord::Migration[6.0]
  def change
    rename_column :baskets, :user_id, :customer_id
  end
end
