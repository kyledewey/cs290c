class Submission < ActiveRecord::Base
  belongs_to :community
  validates :title, length: { minimum: 4 }
  validates :community, presence: true
  validates :url, :url => true
end
