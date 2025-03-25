// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("DOMContentLoaded", () => {
  const toggleButtons = document.querySelectorAll(".toggle-password");

  toggleButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const targetId = button.getAttribute("data-target");
      const input = document.getElementById(targetId);
      if (!input) return;

      const icon = button.querySelector("i");
      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";

      icon.classList.toggle("fa-eye");
      icon.classList.toggle("fa-eye-slash");
    });
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("registration-form");
  const checkbox = document.getElementById("accept_terms");

  if (form && checkbox) {
    form.addEventListener("submit", (event) => {
      if (!checkbox.checked) {
        event.preventDefault();
        alert(
          "Veuillez accepter les conditions générales d'utilisation pour continuer."
        );
      }
    });
  }
});
