document.addEventListener("DOMContentLoaded", () => {
  const faqData = {
    "Quels sont les moyens de paiement ?":
      "Nous acceptons les paiements par carte bancaire via Stripe.",

    "Comment puis-je contacter le support ?":
      "Vous pouvez utiliser le formulaire de contact ou nous écrire à support@odynest.com.",

    "Puis-je annuler une réservation ?":
      "Oui, vous pouvez annuler jusqu'à 48h avant la date de l'expérience.",

    "Comment savoir si ma réservation est confirmée ?":
      "Une fois le paiement effectué, vous recevrez un e-mail de confirmation avec les détails de votre réservation.",

    "Où puis-je retrouver mes réservations ?":
      "Si vous êtes connecté, vous pouvez accéder à votre tableau de bord pour voir toutes vos réservations.",

    "Comment devenir fournisseur d’expériences ?":
      "Rendez-vous dans l’Espace pro via le bouton dédié en haut du site pour créer un compte fournisseur.",

    "Une expérience peut-elle être modifiée ou annulée ?":
      "Oui, en cas d’imprévu, vous serez notifié par e-mail. Une autre date ou un remboursement sera proposé.",

    "Dois-je créer un compte pour réserver ?":
      "Oui, un compte est nécessaire pour effectuer une réservation et suivre vos expériences réservées.",

    "Proposez-vous des expériences à l’étranger ?":
      "Oui, nous proposons des expériences en France et dans d'autres pays. Consultez la section Nos expériences.",

    "Puis-je laisser un avis ?":
      "Oui, après avoir participé à une expérience, vous pourrez laisser un avis dans votre tableau de bord.",
  };

  // Bouton flottant
  const toggleBtn = document.createElement("button");
  toggleBtn.id = "faq-toggle-btn";
  toggleBtn.innerText = "?";
  document.body.appendChild(toggleBtn);

  // Boîte du chatbot
  const container = document.createElement("div");
  container.id = "faq-bot";
  container.innerHTML = `
    <div class="faq-chat">
      <div class="faq-header">💬 Besoin d’aide ?</div>

      <label for="faq-select" style="font-size: 13px;">📋 Questions fréquentes :</label>
      <select id="faq-select">
        <option value="">-- Choisissez une question --</option>
        ${Object.keys(faqData)
          .map((q) => `<option value="${q}">${q}</option>`)
          .join("")}
      </select>

      <div class="faq-body" id="faq-body"></div>
    </div>
  `;
  container.style.display = "none";
  document.body.appendChild(container);

  // Toggle d’affichage
  toggleBtn.addEventListener("click", () => {
    container.style.display =
      container.style.display === "none" ? "block" : "none";
  });

  const body = document.getElementById("faq-body");
  const select = document.getElementById("faq-select");

  // Affichage réponse sur sélection
  select.addEventListener("change", function () {
    const selected = select.value;
    if (selected) {
      const answer = faqData[selected];
      body.innerHTML += `<p><strong>Vous :</strong> ${selected}</p><p><strong>Bot :</strong> ${answer}</p>`;
      body.scrollTop = body.scrollHeight;
    }
  });
});
