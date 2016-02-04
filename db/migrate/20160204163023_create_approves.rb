class CreateApproves < ActiveRecord::Migration
  def change
    create_table :approves do |t|
      t.references :user, index: true, foreign_key: true
      t.references :steward, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
