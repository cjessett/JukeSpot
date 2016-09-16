class Party < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships

  def host
    memberships.where(type: "host").first.user
  end
end
