document.addEventListener("DOMContentLoaded", () => {
  const regForm = document.getElementById("registration-form");
  const checkbox = document.getElementById("accept_terms");

  if (regForm && checkbox) {
    regForm.addEventListener("submit", (event) => {
      if (!checkbox.checked) {
        event.preventDefault();
        alert(
          "Veuillez accepter les conditions générales d'utilisation pour continuer."
        );
      }
    });
  }
});
