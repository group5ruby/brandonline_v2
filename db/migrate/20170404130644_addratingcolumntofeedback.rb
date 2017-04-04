class Addratingcolumntofeedback < ActiveRecord::Migration[5.0]
  def change
  	add_column :feedbacks, :rating, :integer, defaul: '2'
  end
end
