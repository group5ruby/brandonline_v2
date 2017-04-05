class AddGuestToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :guest_id, :integer
  end
end
