class RenameUserUsername < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :username, :spotify_id
  end
end
