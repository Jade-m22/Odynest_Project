# db/seeds.rb

require 'faker'

# Reset des tables
Review.destroy_all
Reservation.destroy_all
Experience.destroy_all
User.destroy_all
Provider.destroy_all

# Création des providers
providers = 3.times.map do
  Provider.create!(
    email: Faker::Internet.unique.email,
    password: "password123"
  )
end

# Création des utilisateurs
users = 10.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123"
  )
end

# Création des expériences avec toutes les validations requises
experiences = 15.times.map do
  Experience.create!(
    title: Faker::Hobby.activity,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    price: rand(20..200),
    location: Faker::Address.city,
    duration: "#{rand(1..5)} heures",
    start_date_1: Faker::Date.forward(days: rand(1..30)),
    start_date_2: Faker::Date.forward(days: rand(31..60)),
    start_date_3: Faker::Date.forward(days: rand(61..90)),
    provider: providers.sample
  )
end

# Création des réservations avec une date valide
reservations = 20.times.map do
  experience = experiences.sample
  user = users.sample
  valid_dates = [experience.start_date_1, experience.start_date_2, experience.start_date_3].compact
  reservation_date = valid_dates.sample # On choisit une date valide

  Reservation.create!(
    user: user,
    experience: experience,
    reservation_date: reservation_date, # Correction ici
    status: %w[pending confirmed canceled].sample
  )
end

# Création des avis uniquement pour les réservations confirmées
reservations.each do |reservation|
  if reservation.status == "confirmed" && rand < 0.7 # 70% de chances d'avoir un avis
    Review.create!(
      user: reservation.user,
      experience: reservation.experience,
      rating: rand(3..5),
      comment: Faker::Lorem.sentence
    )
  end
end

puts "Seed terminé : #{User.count} users, #{Provider.count} providers, #{Experience.count} expériences, #{Reservation.count} réservations, #{Review.count} avis."
