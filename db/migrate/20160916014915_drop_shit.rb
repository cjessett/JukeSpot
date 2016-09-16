class DropShit < ActiveRecord::Migration[5.0]
  def change
    drop_table :memberships

    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :party
      t.string :type
    end
  end
end
