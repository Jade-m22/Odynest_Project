Mailjet.configure do |config|
  config.api_key = ENV["MAILJET_API_KEY"]
  config.api_secret = ENV["MAILJET_API_SECRET"]
end
