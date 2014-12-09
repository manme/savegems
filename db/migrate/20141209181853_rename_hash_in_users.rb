class RenameHashInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :hash, :utoken
    add_index :users, :utoken, unique: true
  end
end
