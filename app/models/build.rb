class Build < ActiveRecord::Base
  extend FriendlyId
  acts_as_votable
  
  friendly_id :title, use: :slugged

  belongs_to :user
  validates :title, presence: true, uniqueness: true 

  VALID_RACES = %w(Protoss Terran Zerg)
  VALID_BUILD_TYPES = %w(Macro All-In Aggressive Cheese)
  validates_inclusion_of :race, :vs_race, in: VALID_RACES , message: "Please pick a race."
  
  validates_inclusion_of :build_type, in: VALID_BUILD_TYPES, message: "Please select a build type."

  validates :body, presence: true

  scope :recent, -> { order("builds.created_at DESC") }  

  def matchup
    self.race[0] + "v" + self.vs_race[0]
  end

  def full_title
    matchup + ": " + self.title
  end
end
