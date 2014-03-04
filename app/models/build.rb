class Build < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
