# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: ENV["MAILJET_API_KEY"],
  password: ENV["MAILJET_API_SECRET"],
  domain: "87.106.231.213",
  address: "in-v3.mailjet.com",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
