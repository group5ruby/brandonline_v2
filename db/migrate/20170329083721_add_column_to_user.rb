class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :avatar ,:string
	add_column :users, :facebook_link, :string
	add_column	:users,	:identity_number, :boolean, :default=>false
	add_column	:users,	:phone_number, :boolean, :default=>false
	add_column	:users, :date_of_birth, :boolean, :default=>false
	add_column	:users, :work_place, :boolean, :default=>false
	add_column	:users,	:career, :boolean, :default=>false
	add_column	:users,	:business, :string
	add_column	:users,	:sex, :boolean, :default=>false
	add_column	:users,	:address, :boolean, :default=>false
	add_column	:users,	:hometown, :boolean, :default=>false
	add_column	:users,	:positive_count, :integer
	add_column	:users,	:negative_count, :integer
	add_column	:users,	:zalo, :string
	add_column	:users,	:is_verified, :boolean, :default=>false
	add_column	:users, :account_status, :integer, :default=> 1
  end
end
