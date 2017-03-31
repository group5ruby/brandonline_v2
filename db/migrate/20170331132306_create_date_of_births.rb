class CreateDateOfBirths < ActiveRecord::Migration[5.0]
  def change
    create_table :date_of_births do |t|
      t.datetime :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
