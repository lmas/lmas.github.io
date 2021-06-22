"use strict";

// WIP: Super simple and privacy friendly analytics.

function postJSON(url, data) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(JSON.stringify(data));
}

postJSON("https://s0rvs5.deta.dev/", {
        tz: Intl.DateTimeFormat().resolvedOptions().timeZone,
        ua: window.navigator.userAgent,
        re: document.referrer,
        ho: location.host,
        pa: location.pathname,
});

