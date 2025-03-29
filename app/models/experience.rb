class Experience < ApplicationRecord
    belongs_to :provider
    has_many :reservations, dependent: :destroy
    has_many :users, through: :reservations
    has_many :reviews, dependent: :destroy

    has_one_attached :photo

    validates :title, :description, :price, :location, :duration,
              :start_date_1, :start_date_2, :start_date_3, presence: true

    validate :at_least_one_future_date

    def available_dates
      [ start_date_1, start_date_2, start_date_3 ].compact
    end

    def past_dates
      available_dates.select { |d| d < Date.today }
    end

    def future_dates
      available_dates.select { |d| d >= Date.today }
    end

    def has_expired_dates?
      past_dates.any?
    end

    def formatted_duration
      case duration
      when 0..59
        "#{duration} minutes"
      when 60..119
        "#{duration / 60} heure"
      when 120..1439
        "#{duration / 60} heures"
      when 1440..2879
        "1 jour"
      when 2880..Float::INFINITY
        "#{duration / 1440} jours"
      else
        "Durée inconnue"
      end
    end

    private

    def at_least_one_future_date
      if future_dates.empty?
        errors.add(:base, "Au moins une des dates doit être dans le futur.")
      end
    end
end
