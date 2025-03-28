document.addEventListener("turbo:load", () => {
  const expForm = document.getElementById("experience-form");
  if (!expForm) return;

  expForm.addEventListener("submit", function (event) {
    const now = new Date();

    const getDateFromFields = (prefix) => {
      const year = parseInt(
        document.getElementById(`experience_${prefix}_1i`)?.value
      );
      const month =
        parseInt(document.getElementById(`experience_${prefix}_2i`)?.value) - 1;
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
});
