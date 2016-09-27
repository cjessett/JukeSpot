class Track < ApplicationRecord
  has_many :juke_tracks, dependent: :destroy
end
