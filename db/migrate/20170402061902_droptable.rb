class Droptable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :identity_numbers
  	drop_table :sexes
  	drop_table :hometowns
  	drop_table :date_of_births
  	drop_table :careers
  	drop_table :addresses
  	drop_table :phone_numbers
  	add_column :users, :description, :string
  end
end
