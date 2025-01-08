document.addEventListener('DOMContentLoaded', function () {
    const includeElements = document.querySelectorAll('[data-include]');
    includeElements.forEach(el => {
        const file = el.getAttribute('data-include');
        fetch(file)
            .then(response => response.text())
            .then(data => {
                el.outerHTML = data;
                // Reinitialize scripts after loading header
                initHeaderScripts();
            })
            .catch(err => console.error('Error loading include file:', err));
    });

    function initHeaderScripts() {
        // Logic from your header.js file (if any)
        const searchIcon = document.getElementById('search-icon');
        const searchInput = document.getElementById('search-input');
        const clearBtn = document.getElementById('clear-btn');

        if (searchIcon && searchInput && clearBtn) {
            searchIcon.addEventListener('click', function (event) {
                this.classList.toggle('active');
                if (!this.classList.contains('active')) {
                    searchInput.value = '';
                }
            });
            searchInput.addEventListener('click', function (event) {
                event.stopPropagation();
            });
            clearBtn.addEventListener('click', function (event) {
                searchIcon.classList.remove('active');
                searchInput.value = '';
            });
        }
    }
});
