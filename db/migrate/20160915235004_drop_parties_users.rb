class DropPartiesUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :parties_users
  end
end
