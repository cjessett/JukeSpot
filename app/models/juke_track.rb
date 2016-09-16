class JukeTrack < ApplicationRecord
  belongs_to :party
  belongs_to :track
  has_many :votes

  def handicap
    self.import ? self.party.threshold : 0
  end

  def points
    handicap + self.votes.sum(:value)
  end
end
