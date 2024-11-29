
<!--JS Header-->
const searchIcon = document.getElementById('search-icon');
const searchInput = document.getElementById('search-input');
const clearBtn = document.getElementById('clear-btn');

searchIcon.addEventListener('click', function (event) {
    this.classList.toggle('active'); // Thêm hoặc gỡ lớp active
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
