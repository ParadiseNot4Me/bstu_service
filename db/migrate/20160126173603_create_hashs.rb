class CreateHashs < ActiveRecord::Migration
  def change
    create_table :hashs do |t|
      t.integer :user_id
      t.string :hash

      t.timestamps
    end
  end
end
