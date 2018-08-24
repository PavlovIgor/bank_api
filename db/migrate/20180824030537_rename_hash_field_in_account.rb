class RenameHashFieldInAccount < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :hash, :acc_hash
  end
end
