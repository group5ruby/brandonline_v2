class Changecolumndatatype < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :date_of_birth
  	change_column :users, :phone_number, :string
  	change_column :users, :address, :string
  	change_column :users, :career, :string
  	change_column :users, :work_place, :string
  	change_column :users, :business, :string
  	change_column :users, :identity_number, :string
  	add_column :users, :date_of_birth, :datetime
  	change_column :users, :sex, :string
  end
end
