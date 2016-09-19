class ChangeThreshold < ActiveRecord::Migration[5.0]
  def change
    remove_column :parties, :threshold
    add_column :parties, :threshold, :integer, null: false, default: 0
  end
end
