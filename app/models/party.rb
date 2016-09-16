class Party < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :juke_tracks

  def host
    memberships.where(type: "host").first.user
  end
end
