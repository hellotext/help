(function () {
  var sidebar = document.querySelector("[data-article-sidebar]");
  var sidebarToggle = sidebar && sidebar.querySelector("[data-sidebar-toggle]");
  var sidebarNav = sidebar && sidebar.querySelector(".article-sidebar__nav");
  var currentSidebarTopicLink = sidebar && sidebar.querySelector(
    ".article-sidebar__topic--current > .article-sidebar__topic-link"
  );
  var guideLayout = document.querySelector(".guide-page__layout");
  var sidebarStorageKey = "hellotext-help:sidebar-collapsed";
  var sidebarNavigationPositionKey = "hellotext-help:sidebar-navigation-position";
  var sidebarAutoCollapseQuery = window.matchMedia
    ? window.matchMedia("(min-width: 1200px) and (max-width: 1279px)")
    : null;

  if (sidebar && sidebarToggle && guideLayout) {
    var sidebarPreferenceIsCollapsed = false;
    var pendingSidebarNavigationPosition = null;

    try {
      sidebarPreferenceIsCollapsed = window.localStorage.getItem(sidebarStorageKey) === "true";
    } catch (_error) {
      sidebarPreferenceIsCollapsed = false;
    }

    try {
      var storedSidebarNavigationPosition = window.sessionStorage.getItem(sidebarNavigationPositionKey);

      window.sessionStorage.removeItem(sidebarNavigationPositionKey);

      if (storedSidebarNavigationPosition) {
        var parsedSidebarNavigationPosition = JSON.parse(storedSidebarNavigationPosition);

        if (parsedSidebarNavigationPosition.path === window.location.pathname) {
          pendingSidebarNavigationPosition = parsedSidebarNavigationPosition;
        }
      }
    } catch (_error) {
      pendingSidebarNavigationPosition = null;
    }

    function applySidebarNavigationPosition() {
      if (!pendingSidebarNavigationPosition || !sidebarNav) {
        return;
      }

      var viewportTop = Number(pendingSidebarNavigationPosition.viewportTop);
      var navScrollTop = Number(pendingSidebarNavigationPosition.navScrollTop);

      if (!Number.isFinite(viewportTop) || !Number.isFinite(navScrollTop)) {
        return;
      }

      var layoutDocumentTop = guideLayout.getBoundingClientRect().top + window.scrollY;
      var targetScrollTop = Math.max(0, layoutDocumentTop - viewportTop);
      var previousScrollBehavior = document.documentElement.style.scrollBehavior;

      document.documentElement.style.scrollBehavior = "auto";
      window.scrollTo(0, targetScrollTop);
      sidebarNav.scrollTop = navScrollTop;
      document.documentElement.style.scrollBehavior = previousScrollBehavior;
    }

    function setSidebarCollapsed(isCollapsed, shouldPersist, isAutomatic) {
      var label = isCollapsed
        ? sidebarToggle.getAttribute("data-expand-label")
        : sidebarToggle.getAttribute("data-collapse-label");

      sidebar.classList.toggle("article-sidebar--collapsed", isCollapsed);
      guideLayout.setAttribute("data-sidebar-collapsed", isCollapsed ? "true" : "false");
      sidebarToggle.setAttribute("aria-expanded", isCollapsed ? "false" : "true");
      sidebarToggle.setAttribute("aria-label", label);
      sidebarToggle.setAttribute("title", label);

      if (isAutomatic) {
        guideLayout.setAttribute("data-sidebar-auto-collapsed", "true");
      } else {
        guideLayout.removeAttribute("data-sidebar-auto-collapsed");
      }

      if (shouldPersist) {
        sidebarPreferenceIsCollapsed = isCollapsed;

        try {
          window.localStorage.setItem(sidebarStorageKey, isCollapsed ? "true" : "false");
        } catch (_error) {
          // Keep the interaction working when storage is unavailable.
        }
      }
    }

    function syncSidebarWithViewport() {
      var shouldCollapseAutomatically = sidebarAutoCollapseQuery && sidebarAutoCollapseQuery.matches;

      setSidebarCollapsed(
        shouldCollapseAutomatically || sidebarPreferenceIsCollapsed,
        false,
        shouldCollapseAutomatically
      );
    }

    syncSidebarWithViewport();
    applySidebarNavigationPosition();
    window.addEventListener("pageshow", applySidebarNavigationPosition, { once: true });
    window.requestAnimationFrame(function () {
      applySidebarNavigationPosition();
      sidebar.setAttribute("data-sidebar-ready", "");
    });

    sidebar.addEventListener("click", function (event) {
      var guideLink = event.target.closest && event.target.closest(".article-sidebar__guides a");
      var isModifiedClick = event.metaKey || event.ctrlKey || event.shiftKey || event.altKey;

      if (
        !guideLink
        || !sidebarNav
        || event.defaultPrevented
        || event.button !== 0
        || isModifiedClick
        || guideLink.target === "_blank"
      ) {
        return;
      }

      var targetUrl = new URL(guideLink.href, window.location.href);

      if (
        targetUrl.origin !== window.location.origin
        || targetUrl.pathname === window.location.pathname
      ) {
        return;
      }

      try {
        window.sessionStorage.setItem(sidebarNavigationPositionKey, JSON.stringify({
          path: targetUrl.pathname,
          viewportTop: Math.max(0, sidebarNav.getBoundingClientRect().top),
          navScrollTop: sidebarNav.scrollTop
        }));
      } catch (_error) {
        // Fall back to the browser's normal navigation when storage is unavailable.
      }
    });

    sidebarToggle.addEventListener("click", function () {
      var shouldCollapse = !sidebar.classList.contains("article-sidebar--collapsed");

      setSidebarCollapsed(shouldCollapse, true, false);
    });

    if (currentSidebarTopicLink) {
      currentSidebarTopicLink.addEventListener("click", function (event) {
        var isModifiedClick = event.metaKey || event.ctrlKey || event.shiftKey || event.altKey;

        if (
          event.defaultPrevented
          || event.button !== 0
          || isModifiedClick
          || !sidebar.classList.contains("article-sidebar--collapsed")
        ) {
          return;
        }

        event.preventDefault();
        setSidebarCollapsed(false, true, false);
      });
    }

    if (sidebarAutoCollapseQuery) {
      if (typeof sidebarAutoCollapseQuery.addEventListener === "function") {
        sidebarAutoCollapseQuery.addEventListener("change", syncSidebarWithViewport);
      } else if (typeof sidebarAutoCollapseQuery.addListener === "function") {
        sidebarAutoCollapseQuery.addListener(syncSidebarWithViewport);
      }
    }
  }

  var toc = document.querySelector("[data-article-toc]");
  var content = document.querySelector(".guide-content");

  if (!content) {
    return;
  }

  var list = toc && toc.querySelector("[data-article-toc-list]");
  var headings = Array.prototype.slice.call(content.querySelectorAll("h2, h3, h4"));
  var codeBlocks = Array.prototype.slice.call(content.querySelectorAll("pre"));
  var copySectionLinkLabel = content.getAttribute("data-copy-section-link-label") || "Copy link to this section";
  var sectionLinkCopiedLabel = content.getAttribute("data-section-link-copied-label") || "Link copied";
  var copyCodeLabel = content.getAttribute("data-copy-code-label") || "Copy code";
  var codeCopiedLabel = content.getAttribute("data-code-copied-label") || "Code copied";
  var copyStatus = document.createElement("span");
  var usedIds = {};
  var links = [];
  var ticking = false;

  copyStatus.className = "sr-only";
  copyStatus.setAttribute("role", "status");
  content.appendChild(copyStatus);

  function slugify(value) {
    return value
      .toLowerCase()
      .normalize("NFD")
      .replace(/[\u0300-\u036f]/g, "")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "") || "section";
  }

  function uniqueId(heading, index) {
    var baseId = heading.id || slugify(heading.textContent);
    var nextId = baseId;
    var suffix = 2;

    while (usedIds[nextId] || (document.getElementById(nextId) && document.getElementById(nextId) !== heading)) {
      nextId = baseId + "-" + suffix;
      suffix += 1;
    }

    usedIds[nextId] = true;
    heading.id = nextId || "section-" + index;
    return heading.id;
  }

  function legacyCopyText(value) {
    return new Promise(function (resolve, reject) {
      var temporaryInput = document.createElement("textarea");

      temporaryInput.value = value;
      temporaryInput.setAttribute("readonly", "");
      temporaryInput.style.position = "fixed";
      temporaryInput.style.opacity = "0";
      document.body.appendChild(temporaryInput);
      temporaryInput.select();

      var didCopy = false;

      try {
        didCopy = document.execCommand("copy");
      } finally {
        temporaryInput.remove();
      }

      if (didCopy) {
        resolve();
      } else {
        reject(new Error("Could not copy text"));
      }
    });
  }

  function copyText(value) {
    if (navigator.clipboard && typeof navigator.clipboard.writeText === "function") {
      return navigator.clipboard.writeText(value).catch(function () {
        return legacyCopyText(value);
      });
    }

    return legacyCopyText(value);
  }

  function sectionUrl(headingId) {
    return window.location.origin
      + window.location.pathname
      + window.location.search
      + "#"
      + encodeURIComponent(headingId);
  }

  function positionCopiedTooltip(button, tooltip) {
    var viewportPadding = 16;
    var buttonRect = button.getBoundingClientRect();
    var tooltipWidth = tooltip.getBoundingClientRect().width;
    var centeredLeft = (buttonRect.width - tooltipWidth) / 2;
    var minimumLeft = viewportPadding - buttonRect.left;
    var maximumLeft = window.innerWidth - viewportPadding - buttonRect.left - tooltipWidth;
    var tooltipLeft = Math.min(Math.max(centeredLeft, minimumLeft), maximumLeft);
    var caretLeft = Math.min(Math.max(buttonRect.width / 2 - tooltipLeft, 20), tooltipWidth - 20);

    tooltip.style.setProperty("--heading-share-tooltip-left", tooltipLeft + "px");
    tooltip.style.setProperty("--heading-share-tooltip-caret-left", caretLeft + "px");
  }

  function addShareButton(heading, headingId, headingText, index) {
    var button = document.createElement("button");
    var icon = document.createElement("span");
    var tooltip = document.createElement("span");
    var copyLabel = copySectionLinkLabel + ": " + headingText;
    var copiedStatusLabel = sectionLinkCopiedLabel + ": " + headingText;
    var tooltipId = "heading-share-tooltip-" + index;
    var resetTimer;

    function hideCopiedTooltip() {
      button.classList.remove("heading-share--copied");
      button.removeAttribute("aria-describedby");
      tooltip.setAttribute("aria-hidden", "true");
    }

    button.type = "button";
    button.className = "heading-share";
    button.setAttribute("aria-label", copyLabel);
    icon.className = "heading-share__icon";
    icon.setAttribute("aria-hidden", "true");
    tooltip.className = "heading-share__tooltip";
    tooltip.id = tooltipId;
    tooltip.setAttribute("role", "tooltip");
    tooltip.setAttribute("aria-hidden", "true");
    tooltip.textContent = sectionLinkCopiedLabel;
    button.appendChild(icon);
    button.appendChild(tooltip);

    button.addEventListener("click", function () {
      copyStatus.textContent = "";

      copyText(sectionUrl(headingId)).then(function () {
        window.clearTimeout(resetTimer);
        hideCopiedTooltip();
        positionCopiedTooltip(button, tooltip);
        void tooltip.offsetHeight;
        button.classList.add("heading-share--copied");
        button.setAttribute("aria-describedby", tooltipId);
        tooltip.setAttribute("aria-hidden", "false");
        copyStatus.textContent = copiedStatusLabel;

        resetTimer = window.setTimeout(function () {
          hideCopiedTooltip();
        }, 1400);
      }).catch(function () {
        window.clearTimeout(resetTimer);
        hideCopiedTooltip();
      });
    });

    heading.appendChild(button);
  }

  function addCodeCopyButton(pre, index) {
    var code = pre.querySelector("code") || pre;
    var frame = pre && pre.parentElement;
    var button = document.createElement("button");
    var icon = document.createElement("span");
    var tooltip = document.createElement("span");
    var tooltipId = "code-copy-tooltip-" + index;
    var resetTimer;

    if (!frame || !frame.classList.contains("highlight")) {
      frame = document.createElement("div");
      pre.parentNode.insertBefore(frame, pre);
      frame.appendChild(pre);
    }

    frame.classList.add("guide-code-block");

    function hideCopiedTooltip() {
      button.classList.remove("code-copy--copied");
      button.removeAttribute("aria-describedby");
      tooltip.setAttribute("aria-hidden", "true");
    }

    button.type = "button";
    button.className = "code-copy";
    button.setAttribute("aria-label", copyCodeLabel);
    icon.className = "code-copy__icon";
    icon.setAttribute("aria-hidden", "true");
    tooltip.className = "heading-share__tooltip code-copy__tooltip";
    tooltip.id = tooltipId;
    tooltip.setAttribute("role", "tooltip");
    tooltip.setAttribute("aria-hidden", "true");
    tooltip.textContent = codeCopiedLabel;
    button.appendChild(icon);
    button.appendChild(tooltip);

    button.addEventListener("click", function () {
      copyStatus.textContent = "";

      copyText(code.textContent).then(function () {
        window.clearTimeout(resetTimer);
        hideCopiedTooltip();
        positionCopiedTooltip(button, tooltip);
        void tooltip.offsetHeight;
        button.classList.add("code-copy--copied");
        button.setAttribute("aria-describedby", tooltipId);
        tooltip.setAttribute("aria-hidden", "false");
        copyStatus.textContent = codeCopiedLabel;

        resetTimer = window.setTimeout(function () {
          hideCopiedTooltip();
        }, 1400);
      }).catch(function () {
        window.clearTimeout(resetTimer);
        hideCopiedTooltip();
      });
    });

    frame.appendChild(button);
  }

  codeBlocks.forEach(addCodeCopyButton);

  if (!toc || !list || headings.length === 0) {
    return;
  }

  function setActiveLink() {
    var activeIndex = 0;

    headings.forEach(function (heading, index) {
      if (heading.getBoundingClientRect().top <= 160) {
        activeIndex = index;
      }
    });

    links.forEach(function (link, index) {
      if (index === activeIndex) {
        link.setAttribute("aria-current", "location");
      } else {
        link.removeAttribute("aria-current");
      }
    });

    ticking = false;
  }

  headings.forEach(function (heading, index) {
    var item = document.createElement("li");
    var link = document.createElement("a");
    var headingId = uniqueId(heading, index);
    var headingText = heading.textContent.trim();

    item.className = "article-toc__item article-toc__item--" + heading.tagName.toLowerCase();
    link.href = "#" + encodeURIComponent(headingId);
    link.textContent = headingText;
    item.appendChild(link);
    list.appendChild(item);
    links.push(link);
    addShareButton(heading, headingId, headingText, index);
  });

  toc.hidden = false;
  setActiveLink();

  window.addEventListener("scroll", function () {
    if (!ticking) {
      window.requestAnimationFrame(setActiveLink);
      ticking = true;
    }
  }, { passive: true });
})();
