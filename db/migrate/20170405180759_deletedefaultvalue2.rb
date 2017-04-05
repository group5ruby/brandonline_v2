class Deletedefaultvalue2 < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :identity_number, :string, :default=>""
  	change_column :users, :phone_number, :string, :default=>""
  	change_column :users, :work_place, :string, :default=>""
  	change_column :users, :career, :string, :default=>""
  	change_column :users, :sex, :string, :default=>""
  	change_column :users, :address, :string, :default=>""
  	change_column :users, :hometown, :string,  :default=>""
  end
end
