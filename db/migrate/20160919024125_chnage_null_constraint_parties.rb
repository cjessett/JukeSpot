class ChnageNullConstraintParties < ActiveRecord::Migration[5.0]
  def change
    change_column_null :parties, :threshold, true
    change_column_default :parties, :threshold, from: 0, to: 0
  end
end
