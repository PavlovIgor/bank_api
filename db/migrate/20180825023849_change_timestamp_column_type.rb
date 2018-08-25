class ChangeTimestampColumnType < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :timestamp
    add_column :accounts, :timestamp, :integer
  end
end
