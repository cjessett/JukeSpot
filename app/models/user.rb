class User < ApplicationRecord
  has_many :memberships
  has_many :parties, :through => :memberships
end
