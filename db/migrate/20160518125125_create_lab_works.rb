class CreateLabWorks < ActiveRecord::Migration
  def change
    create_table :lab_works do |t|
      t.references :subject, index: true, foreign_key: true
      t.integer :n
      t.date :time

      t.timestamps null: false
    end
  end
end
