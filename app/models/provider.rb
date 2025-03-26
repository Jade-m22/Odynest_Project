class Provider < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  has_one_attached :profile_picture
  validates :first_name, length: { minimum: 2, maximum: 50 }, allow_blank: true
end
