class Build < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true

  VALID_RACES = %w(Protoss Terran Zerg)
  validates_inclusion_of :race, :vs_race, in: VALID_RACES , message: "Please pick a race."
  
  validates :body, presence: true

  scope :recent, -> { order("builds.created_at DESC") }

  def matchup
    self.race[0] + "v" + self.vs_race[0]
  end

  def full_title
    matchup + ": " + self.title
  end
end
