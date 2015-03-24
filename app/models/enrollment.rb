class Enrollment < ActiveRecord::Base
  belongs_to :talk_concert
  belongs_to :user

  validates :talk_concert, presence: true
  validates :user, presence: true, uniqueness: { scope: :talk_concert }
end
