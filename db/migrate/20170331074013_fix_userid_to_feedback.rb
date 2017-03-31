class FixUseridToFeedback < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedbacks, :host_id, :user_id
  end
end

