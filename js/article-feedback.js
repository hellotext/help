(function () {
  var feedback = document.querySelector("[data-guide-feedback]");

  if (!feedback) {
    return;
  }

  var inputs = Array.prototype.slice.call(feedback.querySelectorAll("input[name='article-feedback']"));
  var actions = feedback.querySelector(".guide-feedback__actions");
  var status = feedback.querySelector("[data-guide-feedback-status]");
  var articleId = feedback.getAttribute("data-article-id") || window.location.pathname;
  var articleSection = feedback.getAttribute("data-article-section") || "unknown";
  var articleLanguage = feedback.getAttribute("data-article-language") || document.documentElement.lang || "unknown";
  var thankYouMessage = feedback.getAttribute("data-feedback-thanks") || "Thanks for your feedback.";
  var storageKey = "hellotext-help:article-feedback:v1:"
    + encodeURIComponent(articleId)
    + ":"
    + encodeURIComponent(articleLanguage);
  var validResponses = ["yes", "no"];
  var hasSubmitted = false;

  if (inputs.length === 0) {
    return;
  }

  function isValidResponse(response) {
    return validResponses.indexOf(response) !== -1;
  }

  function storedResponse() {
    try {
      var response = window.localStorage.getItem(storageKey);
      return isValidResponse(response) ? response : null;
    } catch (_error) {
      return null;
    }
  }

  function persistResponse(response) {
    try {
      window.localStorage.setItem(storageKey, response);
    } catch (_error) {
      // Keep feedback working for this page view when storage is unavailable.
    }
  }

  function showSubmittedState(response, shouldAnnounce) {
    hasSubmitted = true;
    feedback.setAttribute("data-feedback-submitted", "true");

    if (actions) {
      actions.setAttribute("aria-disabled", "true");
    }

    inputs.forEach(function (input) {
      input.checked = input.value === response;
      input.disabled = true;
    });

    if (shouldAnnounce && status) {
      status.textContent = thankYouMessage;
    }
  }

  function trackResponse(response) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
      event: "help_article_feedback",
      feedback_response: response,
      article_id: articleId,
      article_section: articleSection,
      article_language: articleLanguage
    });
  }

  var previousResponse = storedResponse();

  if (previousResponse) {
    showSubmittedState(previousResponse, false);
  }

  inputs.forEach(function (input) {
    input.addEventListener("change", function () {
      if (hasSubmitted || !input.checked || !isValidResponse(input.value)) {
        return;
      }

      var response = input.value;

      showSubmittedState(response, true);
      persistResponse(response);
      trackResponse(response);
    });
  });
})();
