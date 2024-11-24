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