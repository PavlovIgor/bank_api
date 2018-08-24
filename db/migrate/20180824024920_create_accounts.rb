class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.datetime :timestamp, null: false
      t.string :hash, null: false, unique: true
      t.integer :nonce, null: false

      t.timestamps
    end
  end
end
