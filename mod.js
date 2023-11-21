document.addEventListener("DOMContentLoaded", () => {

    let minimizeBtn = document.querySelector(".window-minimize");
    let minimizeChild = minimizeBtn.firstElementChild;
    minimizeBtn.removeChild(minimizeChild);
    minimizeBtn.innerHTML = `<svg width="10" height="10" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M3 22L25 22" stroke="white" stroke-width="4" stroke-linecap="round"/>
        </svg>`;

    let maximizeBtn = document.querySelector(".window-maximize");
    let maximizeChild = maximizeBtn.firstElementChild;
    maximizeBtn.removeChild(maximizeChild);
    maximizeBtn.innerHTML = `<svg width="10" height="10" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect x="3" y="4" width="22" height="19" rx="3" stroke="white" stroke-width="4"/>
        </svg>
        `;

    let closeBtn = document.querySelector(".window-close");
    let closeChild = closeBtn.firstElementChild;
    closeBtn.removeChild(closeChild);
    closeBtn.innerHTML = `<svg width="10" height="10" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M4 24L24 4" stroke="white" stroke-width="4" stroke-linecap="round"/>
        <path d="M4 4L24 24" stroke="white" stroke-width="4" stroke-linecap="round"/>
        </svg>
        `;
});