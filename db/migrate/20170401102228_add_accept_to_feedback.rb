class AddAcceptToFeedback < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :accepted_at, :datetime
  end
end
