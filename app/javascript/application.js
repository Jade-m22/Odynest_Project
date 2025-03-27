import "@hotwired/turbo-rails";
import "controllers";
import "password";
import "chatbot";
import "quiz";

document.addEventListener("DOMContentLoaded", () => {
  // ✅ Case à cocher CGU - registration
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

  // 📅 Validation des dates dans le futur - experience
  const expForm = document.getElementById("experience-form");
  if (expForm) {
    expForm.addEventListener("submit", function (event) {
      const now = new Date();

      const getDateFromFields = (prefix) => {
        const year = parseInt(
          document.getElementById(`experience_${prefix}_1i`)?.value
        );
        const month =
          parseInt(document.getElementById(`experience_${prefix}_2i`)?.value) -
          1;
        const day = parseInt(
          document.getElementById(`experience_${prefix}_3i`)?.value
        );
        const hour = parseInt(
          document.getElementById(`experience_${prefix}_4i`)?.value
        );
        const minute = parseInt(
          document.getElementById(`experience_${prefix}_5i`)?.value
        );
        return new Date(year, month, day, hour, minute);
      };

      const d1 = getDateFromFields("start_date_1");
      const d2 = getDateFromFields("start_date_2");
      const d3 = getDateFromFields("start_date_3");

      const hasFutureDate = [d1, d2, d3].some((date) => date >= now);

      if (!hasFutureDate) {
        alert("Veuillez entrer au moins une date dans le futur.");
        event.preventDefault();
      }
    });
  }
});
