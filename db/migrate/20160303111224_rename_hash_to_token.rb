class RenameHashToToken < ActiveRecord::Migration
  def change
    rename_column :hashs, :hash, :token
  end
end
