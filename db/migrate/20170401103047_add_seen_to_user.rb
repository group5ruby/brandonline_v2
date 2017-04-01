class AddSeenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seen, :datetime
  end
end
