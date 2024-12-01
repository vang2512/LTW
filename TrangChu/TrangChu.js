
/*JS Header */
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

/*JS Event News*/
const swiper = new Swiper('.slider-wrapper', {
    loop: true,
    spaceBetween: 100,
    slidesPerView: 3,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },

    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    breakpoints: {
        0: {
            slidesPerView: 1
        },
        640: {
            slidesPerView: 2
        },
        1280: {
            slidesPerView: 3
        },

    }
});
