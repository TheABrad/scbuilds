class Build < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true

  VALID_RACES = %w(Protoss Terran Zerg)
  validates_inclusion_of :race, :vs_race, in: VALID_RACES , message: "Please pick a race."
  
  validates :body, presence: true

  scope :recent, order("builds.created_at DESC")
end
