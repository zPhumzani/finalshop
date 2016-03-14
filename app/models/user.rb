class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
  	[
  		:first_name,
  		[:first_name, :last_name],
  		[:first_name, :last_name, :created_at]
  	]
  end
  
  has_many :classifieds
  has_one :profile
  after_create :make_profile
  validates :slug, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  delegate :bio, to: :profile
  def to_s
  	"#{first_name} #{last_name}"
  end

  def make_profile
    self.create_profile bio: "As Cool As Ice"
  end
end
