class TalkConcert < ActiveRecord::Base
  resourcify
  include Authority::Abilities

  belongs_to :user
  has_many :enrollments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
