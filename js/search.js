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

  function safeSearchUrl(value) {
    try {
      var url = new URL(value, window.location.origin);

      if ((url.protocol !== "http:" && url.protocol !== "https:") || url.origin !== window.location.origin) {
        return null;
      }

      return url.pathname + url.search + url.hash;
    } catch (error) {
      return null;
    }
  }

  function appendResultText(resultLink, className, value) {
    var element = document.createElement("span");

    element.className = className;
    element.textContent = value;
    resultLink.appendChild(element);
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
      resultsContainer.replaceChildren();
      return;
    }

    if (results.length === 0) {
      var emptyResult = document.createElement("div");

      currentResults = [];
      resultsContainer.hidden = false;
      setResultsExpanded(true);
      clearSelectedResult();
      emptyResult.className = "search-empty";
      emptyResult.textContent = emptyMessage;
      resultsContainer.replaceChildren(emptyResult);
      return;
    }

    currentResults = results.slice(0, 6);
    selectedIndex = 0;
    resultsContainer.hidden = false;
    setResultsExpanded(true);
    resultsContainer.replaceChildren();

    currentResults.forEach(function (item, index) {
      var resultLink = document.createElement("a");

      resultLink.className = "search-result";
      resultLink.id = "search-result-" + index;
      resultLink.setAttribute("role", "option");
      resultLink.setAttribute("aria-selected", "false");
      resultLink.setAttribute("href", item.url);
      appendResultText(resultLink, "search-result-topic", item.topic);
      appendResultText(resultLink, "search-result-title", item.title);
      appendResultText(resultLink, "search-result-description", item.description);
      resultsContainer.appendChild(resultLink);
    });

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
          var url = safeSearchUrl(item.url);

          if (!url) {
            throw new Error("Search index contains an unsafe URL");
          }

          return Object.assign({}, item, { url: url, searchText: buildText(item) });
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
