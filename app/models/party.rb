class Party < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :juke_tracks
end
