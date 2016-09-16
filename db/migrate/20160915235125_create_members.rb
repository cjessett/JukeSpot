class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :users, index: true
      t.belongs_to :parties, index: true
      t.string :typet

      t.timestamps
    end
  end
end
