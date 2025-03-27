# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "chatbot", to: "chatbot.js"
pin 'quiz', to: "quiz.js"
pin 'password', to: "password.js"
pin 'validate_cgu', to: "validate_cgu.js"
pin "validate_dates", to: "validate_dates.js"