class RenameHashField < ActiveRecord::Migration
  def change
  	change_table :hashs do |t|
  t.rename :hash, :token
	end
  end
end
