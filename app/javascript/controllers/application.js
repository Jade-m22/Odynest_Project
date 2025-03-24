import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

function generatePassword() {
  const charset =
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";
  let password = "";
  for (let i = 0; i < 16; i++) {
    password += charset[Math.floor(Math.random() * charset.length)];
  }

  document.getElementById(
    "suggested-password"
  ).innerText = `Mot de passe suggéré : ${password}`;

  // Remplir le champ automatiquement
  const passwordField = document.getElementById("user_password");
  if (passwordField) {
    passwordField.value = password;
  }
}
