class Deletedefaultvalue < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :identity_number, :string
  	change_column :users, :phone_number, :string
  	change_column :users, :work_place, :string
  	change_column :users, :career, :string
  	change_column :users, :sex, :string
  	change_column :users, :address, :string
  	change_column :users, :hometown, :string
  end
end
