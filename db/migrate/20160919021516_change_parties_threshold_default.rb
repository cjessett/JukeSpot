class ChangePartiesThresholdDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :parties, :threshold, 0
  end
end
