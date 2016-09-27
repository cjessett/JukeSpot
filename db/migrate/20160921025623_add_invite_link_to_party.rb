class AddInviteLinkToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :invite_link, :string, index: true
  end
end
