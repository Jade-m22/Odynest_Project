class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :experiences, through: :reservations
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true, allow_blank: true

  def is_admin?
    admin == true
  end
end
