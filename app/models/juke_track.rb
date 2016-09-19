class JukeTrack < ApplicationRecord
  belongs_to :party, touch: true
  belongs_to :track
  has_many :votes
  after_touch :update_status

  def update_status
    self.active = self.points >= self.party.threshold
    self.save
    self.party.touch
  end

  def handicap
    self.import ? self.party.threshold : 0
  end

  def points
    handicap + self.votes.sum(:value)
  end
end
