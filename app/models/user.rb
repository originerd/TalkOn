class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :talk_concerts, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :auth_token, uniqueness: true

  before_validation(on: :create) do
    generate_authentication_token!
  end

  after_create :set_default_role

  # before validation

  # generate authentication token for authorize of api on create
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: self.auth_token)
  end

  # after create

  # set default role to user
  def set_default_role
    add_role :user
  end
end
