User.create!(
  email: 'admin@odynest.com',
  password: 'password123',
  password_confirmation: 'password123',
  admin: true,
  username: 'admin'
)

puts "Admin créé avec succès."
