class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :guest_id
      t.integer :host_id
      t.text :content

      t.timestamps
    end
  end
end
