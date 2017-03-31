class CreateWorkPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :work_places do |t|
      t.string :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
