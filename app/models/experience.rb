class Experience < ApplicationRecord
    belongs_to :provider
    has_many :reservations, dependent: :destroy
    has_many :users, through: :reservations
    has_many :reviews, dependent: :destroy

    validates :title, :description, :price, :location, :duration, :start_date_1, :start_date_2, :start_date_3, presence: true

    def available_dates
        [ start_date_1, start_date_2, start_date_3 ].compact
    end
end
