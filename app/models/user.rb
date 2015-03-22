class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :talk_concerts, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }

  after_create :set_default_role

  private

  def set_default_role
    add_role :user
  end
end
