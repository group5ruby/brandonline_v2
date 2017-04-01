class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :account_number

      t.timestamps
    end
  end
end
