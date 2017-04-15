class AddTypeWebToConnect < ActiveRecord::Migration[5.0]
  def change
    add_column :connects, :type_web, :string
  end
end
