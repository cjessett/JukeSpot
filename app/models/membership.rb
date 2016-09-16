class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :party

  TYPES = ["host", "normal"]
end
