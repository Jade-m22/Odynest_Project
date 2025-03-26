document.addEventListener("DOMContentLoaded", () => {
  const faqData = {
    "Quels sont les moyens de paiement ?":
      "Nous acceptons les paiements par carte bancaire via Stripe.",
    "Comment puis-je contacter le support ?":
      "Vous pouvez utiliser le formulaire de contact ou nous écrire à support@odynest.com.",
    "Puis-je annuler une réservation ?":
      "Oui, vous pouvez annuler jusqu'à 48h avant la date de l'expérience.",
  };

  // Création du bouton d'ouverture
  const toggleBtn = document.createElement("button");
  toggleBtn.id = "faq-toggle-btn";
  toggleBtn.innerText = "?";
  document.body.appendChild(toggleBtn);

  // Création de la boîte du chatbot
  const container = document.createElement("div");
  container.id = "faq-bot";
  container.innerHTML = `
    <div class="faq-chat">
      <div class="faq-header">💬 Besoin d’aide ?</div>
      <div class="faq-body" id="faq-body"></div>
      <input type="text" id="faq-input" placeholder="Posez votre question..." />
    </div>
  `;
  document.body.appendChild(container);
  container.style.display = "none";

  // Toggle bouton
  toggleBtn.addEventListener("click", () => {
    container.style.display =
      container.style.display === "none" ? "block" : "none";
  });

  // Logique de réponses
  const input = document.getElementById("faq-input");
  const body = document.getElementById("faq-body");

  input.addEventListener("keypress", function (e) {
    if (e.key === "Enter") {
      const question = input.value.trim();
      if (!question) return;
      const answer =
        faqData[question] ||
        "Désolé, je ne connais pas la réponse à cette question.";
      body.innerHTML += `<p><strong>Vous :</strong> ${question}</p><p><strong>Bot :</strong> ${answer}</p>`;
      input.value = "";
      body.scrollTop = body.scrollHeight;
    }
  });
});
