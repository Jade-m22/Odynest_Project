# Supprime toutes les données existantes pour éviter les doublons
Review.destroy_all
Reservation.destroy_all
Experience.destroy_all
Provider.destroy_all
User.destroy_all

# Création d'utilisateurs
users = []
users << User.create!(email: "admin@example.com", password: "password", admin: true)
users << User.create!(email: "user1@example.com", password: "password", admin: false)
users << User.create!(email: "user2@example.com", password: "password", admin: false)

puts "✅ Création de #{users.count} utilisateurs"

# Création de providers
providers = []
3.times do |i|
  providers << Provider.create!(
    email: "provider#{i + 1}@example.com",
    password: "password"
  )
end

puts "✅ Création de #{providers.count} providers"

# Création d'expériences
experiences = []
15.times do |i|
  experiences << Experience.create!(
    title: "Expérience #{i + 1}",
    description: "Description de l'expérience #{i + 1}",
    price: rand(50..200),
    location: "Ville #{i + 1}",
    duration: [ 60, 90, 120 ].sample,
    start_date_1: Time.now + rand(1..10).days,
    start_date_2: Time.now + rand(11..20).days,
    start_date_3: Time.now + rand(21..30).days,
    provider: providers.sample
  )
end

puts "✅ Création de #{experiences.count} expériences"

# Création de réservations
reservations = []
users.each do |user|
  experiences.sample(2).each do |exp|
    reservations << Reservation.create!(
      user: user,
      experience: exp,
      reservation_date: exp.start_date_1,
      status: [ "pending", "confirmed", "canceled" ].sample
    )
  end
end

puts "✅ Création de #{reservations.count} réservations"

# Création d'avis
reviews = []
users.each do |user|
  experiences.sample(2).each do |exp|
    reviews << Review.create!(
      user: user,
      experience: exp,
      rating: rand(1..5),
      comment: "Super expérience, je recommande !"
    )
  end
end

puts "✅ Création de #{reviews.count} avis"
