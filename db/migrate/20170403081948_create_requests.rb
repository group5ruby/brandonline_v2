class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :image
      t.datetime :handle_at

      t.timestamps
    end
  end
end
