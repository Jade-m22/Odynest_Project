class Provider < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  has_one_attached :profile_picture
  validates :first_name, length: { minimum: 2, maximum: 50 }, allow_blank: true

  def profile_picture_url
    if profile_picture.attached?
      profile_picture.service_url
    else
      ActionController::Base.helpers.asset_path('default_profile_picture.png')
    end
  end
end
