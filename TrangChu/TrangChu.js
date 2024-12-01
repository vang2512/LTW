
<!--JS Event News-->
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
<!--JS Header & Footer-->
document.addEventListener('DOMContentLoaded', () => {
    const cache = new Map();
    async function loadContent() {
        const elements = document.querySelectorAll('[data-include]');
        for (const el of elements) {
            const file = el.getAttribute('data-include');
            if (file) {
                if (cache.has(file)) {
                    el.innerHTML = cache.get(file);
                } else {
                    const response = await fetch(file);
                    if (response.ok) {
                        const text = await response.text();
                        cache.set(file, text);
                        el.innerHTML = text;
                    } else {
                        el.innerHTML = "Không thể tải nội dung.";
                    }
                }
            }
        }
    }
    loadContent();
});



