(function () {
  var container = document.querySelector("[data-search]");

  if (!container) {
    return;
  }

  var input = container.querySelector("[data-search-input]");
  var resultsContainer = container.querySelector("[data-search-results]");
  var searchUrl = container.getAttribute("data-search-url");
  var emptyMessage = container.getAttribute("data-search-empty");
  var index = [];
  var indexLoaded = false;
  var currentResults = [];
  var selectedIndex = -1;

  if (!input || !resultsContainer || !searchUrl) {
    return;
  }

  function normalize(value) {
    return value
      .toString()
      .toLowerCase()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "");
  }

  function buildText(item) {
    return normalize([item.title, item.description, item.topic, item.content].join(" "));
  }

  function escapeHtml(value) {
    return value.toString().replace(/[&<>"']/g, function (character) {
      return {
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#039;"
      }[character];
    });
  }

  function scoreResult(item, terms) {
    var score = 0;
    var title = normalize(item.title);
    var description = normalize(item.description);
    var topic = normalize(item.topic);
    var content = normalize(item.content);

    terms.forEach(function (term) {
      if (title.indexOf(term) > -1) {
        score += 8;
      }

      if (topic.indexOf(term) > -1) {
        score += 4;
      }

      if (description.indexOf(term) > -1) {
        score += 3;
      }

      if (content.indexOf(term) > -1) {
        score += 1;
      }
    });

    return score;
  }

  function setResultsExpanded(isExpanded) {
    input.setAttribute("aria-expanded", isExpanded ? "true" : "false");
  }

  function clearSelectedResult() {
    selectedIndex = -1;
    input.removeAttribute("aria-activedescendant");
  }

  function updateSelectedResult() {
    var resultLinks = resultsContainer.querySelectorAll(".search-result");

    resultLinks.forEach(function (resultLink, index) {
      var isSelected = index === selectedIndex;

      resultLink.classList.toggle("search-result-selected", isSelected);
      resultLink.setAttribute("aria-selected", isSelected ? "true" : "false");

      if (isSelected) {
        input.setAttribute("aria-activedescendant", resultLink.id);
        resultLink.scrollIntoView({ block: "nearest" });
      }
    });
  }

  function hideResults() {
    resultsContainer.hidden = true;
    setResultsExpanded(false);
    clearSelectedResult();
  }

  function renderResults(results, query) {
    if (query.length < 2) {
      currentResults = [];
      hideResults();
      resultsContainer.innerHTML = "";
      return;
    }

    if (results.length === 0) {
      currentResults = [];
      resultsContainer.hidden = false;
      setResultsExpanded(true);
      clearSelectedResult();
      resultsContainer.innerHTML = '<div class="search-empty">' + escapeHtml(emptyMessage) + "</div>";
      return;
    }

    currentResults = results.slice(0, 6);
    selectedIndex = 0;
    resultsContainer.hidden = false;
    setResultsExpanded(true);
    resultsContainer.innerHTML = currentResults
      .map(function (item, index) {
        var resultId = "search-result-" + index;

        return [
          '<a class="search-result" id="' + resultId + '" role="option" aria-selected="false" href="' + escapeHtml(item.url) + '">',
          '<span class="search-result-topic">' + escapeHtml(item.topic) + "</span>",
          '<span class="search-result-title">' + escapeHtml(item.title) + "</span>",
          '<span class="search-result-description">' + escapeHtml(item.description) + "</span>",
          "</a>"
        ].join("");
      })
      .join("");

    updateSelectedResult();
  }

  function search(query) {
    var terms = normalize(query)
      .split(/\s+/)
      .filter(function (term) {
        return term.length > 1;
      });

    if (terms.length === 0) {
      renderResults([], "");
      return;
    }

    var results = index
      .filter(function (item) {
        return terms.every(function (term) {
          return item.searchText.indexOf(term) > -1;
        });
      })
      .map(function (item) {
        return Object.assign({}, item, { score: scoreResult(item, terms) });
      })
      .sort(function (a, b) {
        return b.score - a.score || a.title.localeCompare(b.title);
      });

    renderResults(results, query);
  }

  function loadIndex() {
    if (indexLoaded) {
      return Promise.resolve();
    }

    return fetch(searchUrl)
      .then(function (response) {
        if (!response.ok) {
          throw new Error("Could not load search index");
        }

        return response.json();
      })
      .then(function (items) {
        index = items.map(function (item) {
          return Object.assign({}, item, { searchText: buildText(item) });
        });
        indexLoaded = true;
      })
      .catch(function () {
        resultsContainer.hidden = true;
      });
  }

  input.addEventListener("input", function () {
    loadIndex().then(function () {
      search(input.value);
    });
  });

  input.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      hideResults();
      return;
    }

    if (resultsContainer.hidden || currentResults.length === 0) {
      return;
    }

    if (event.key === "ArrowDown") {
      event.preventDefault();
      resultsContainer.classList.add("search-results-keyboard");
      selectedIndex = selectedIndex >= currentResults.length - 1 ? 0 : selectedIndex + 1;
      updateSelectedResult();
    }

    if (event.key === "ArrowUp") {
      event.preventDefault();
      resultsContainer.classList.add("search-results-keyboard");
      selectedIndex = selectedIndex <= 0 ? currentResults.length - 1 : selectedIndex - 1;
      updateSelectedResult();
    }

    if (event.key === "Enter" && selectedIndex > -1) {
      event.preventDefault();
      window.location.href = currentResults[selectedIndex].url;
    }
  });

  document.addEventListener("click", function (event) {
    if (!container.contains(event.target)) {
      hideResults();
    }
  });

  resultsContainer.addEventListener("mousemove", function (event) {
    var resultLink = event.target.closest(".search-result");

    if (!resultLink) {
      return;
    }

    resultsContainer.classList.remove("search-results-keyboard");
    selectedIndex = Array.prototype.indexOf.call(resultsContainer.querySelectorAll(".search-result"), resultLink);
    updateSelectedResult();
  });

  input.addEventListener("focus", function () {
    if (input.value.length > 1) {
      loadIndex().then(function () {
        search(input.value);
      });
    }
  });
})();
