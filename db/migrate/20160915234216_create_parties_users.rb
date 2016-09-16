class CreatePartiesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :parties_users do |t|
      t.belongs_to :users
      t.belongs_to :party
      t.string :type
    end
  end
end
