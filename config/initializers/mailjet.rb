Mailjet.configure do |config|
  config.api_key = ENV["MAILJET_API_KEY"]
  config.api_secret_key = ENV["MAILJET_API_SECRET"]
end
