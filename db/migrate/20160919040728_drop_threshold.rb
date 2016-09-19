class DropThreshold < ActiveRecord::Migration[5.0]
  def change
    remove_column :parties, :threshold
    add_column :parties, :threshold, :integer, default: 0, null: false
  end
end
