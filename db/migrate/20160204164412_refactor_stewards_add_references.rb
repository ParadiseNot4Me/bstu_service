class RefactorStewardsAddReferences < ActiveRecord::Migration
  def change
  	 add_foreign_key "stewards", "students"
  end
end
