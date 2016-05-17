class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
