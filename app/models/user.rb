class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  
  def is_admin?
  admin
  end
end