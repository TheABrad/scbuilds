class Build < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates_inclusion_of :race, in: %w( Protoss Terran Zerg), message: "please pick a race"
  validates :body, presence: true
end
