document.addEventListener('DOMContentLoaded', function () {
    const filterDropdown = document.getElementById('filter');
    const productGrid = document.querySelector('.product-grid');
    const productCards = Array.from(productGrid.children);

    // Sắp xếp sản phẩm dựa trên lựa chọn
    filterDropdown.addEventListener('change', function () {
        const filterValue = this.value;

        let sortedProducts = [];

        if (filterValue === 'popular') {
            // Sắp xếp theo độ phổ biến (bán chạy)
            sortedProducts = productCards.sort((a, b) => {
                return b.dataset.popular - a.dataset.popular;
            });
        } else if (filterValue === 'price-low-high') {
            // Sắp xếp giá từ rẻ tới đắt
            sortedProducts = productCards.sort((a, b) => {
                return a.dataset.price - b.dataset.price;
            });
        } else if (filterValue === 'price-high-low') {
            // Sắp xếp giá từ đắt tới rẻ
            sortedProducts = productCards.sort((a, b) => {
                return b.dataset.price - a.dataset.price;
            });
        } else {
            // Mặc định (không sắp xếp)
            sortedProducts = productCards;
        }

        // Cập nhật thứ tự trong lưới sản phẩm
        productGrid.innerHTML = '';
        sortedProducts.forEach(product => productGrid.appendChild(product));
    });
});

        // Hàm lọc sản phẩm theo giá
        const filterByPrice = (range) => {
            if (range === '30-40') {
                return productCards.filter(card => {
                    const price = parseInt(card.dataset.price);
                    return price >= 30000 && price <= 40000;
                });
            }
            return productCards;
        };


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


        