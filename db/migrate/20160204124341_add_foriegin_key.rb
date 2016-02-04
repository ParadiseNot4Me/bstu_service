class AddForieginKey < ActiveRecord::Migration
  def change
    add_foreign_key "users_roles", "roles"
    add_foreign_key "users_roles", "users"
  end
end
