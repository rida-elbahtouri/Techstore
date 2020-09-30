class RenameUserid < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :user_id, :seller_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
