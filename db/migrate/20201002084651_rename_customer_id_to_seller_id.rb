class RenameCustomerIdToSellerId < ActiveRecord::Migration[6.0]
  def change
    rename_column :sel_details, :customer_id, :seller_id
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
