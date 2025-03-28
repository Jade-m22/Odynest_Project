document.addEventListener("turbo:load", () => {
  // 👁️ Toggle mot de passe
  const toggleButtons = document.querySelectorAll(".toggle-password");

  toggleButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const targetId = button.getAttribute("data-target");
      const input = document.getElementById(targetId);
      if (!input) return;

      const icon = button.querySelector("i");
      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";

      if (icon) {
        icon.classList.toggle("fa-eye");
        icon.classList.toggle("fa-eye-slash");
      }
    });
  });

  // 🔒 Générateur de mot de passe sécurisé
  window.generatePassword = function () {
    const charset =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+";
    let password = "";
    for (let i = 0; i < 16; i++) {
      password += charset[Math.floor(Math.random() * charset.length)];
    }

    const passwordField = document.getElementById("user_password");
    const suggestionText = document.getElementById("suggested-password");

    if (passwordField) passwordField.value = password;
    if (suggestionText)
      suggestionText.innerText = `Mot de passe suggéré : ${password}`;
  };
});
