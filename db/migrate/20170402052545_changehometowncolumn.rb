class Changehometowncolumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :hometown, :string
  end
end
