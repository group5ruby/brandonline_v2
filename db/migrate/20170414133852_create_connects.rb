class CreateConnects < ActiveRecord::Migration[5.0]
  def change
    create_table :connects do |t|
      t.string :title
      t.string :image_url
      t.integer :type
      t.references :user, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
