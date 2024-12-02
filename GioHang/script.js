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


        // Lấy tất cả các nút decrease và increase
        const decreaseBtns = document.querySelectorAll('.decrease-btn');
        const increaseBtns = document.querySelectorAll('.increase-btn');

        // Thêm sự kiện click cho các nút decrease
        decreaseBtns.forEach(btn => {
            btn.addEventListener('click', function () {
                const quantityInput = this.nextElementSibling;
                let quantity = parseInt(quantityInput.value);
                if (quantity > 1) {
                    quantity--;
                    quantityInput.value = quantity.toString();
                    updateTotalPrice(this);
                }
            });
        }); // Thêm sự kiện click cho các nút increase
        increaseBtns.forEach(btn => {
            btn.addEventListener('click', function () {
                const quantityInput = this.previousElementSibling;
                let quantity = parseInt(quantityInput.value);
                quantity++;
                quantityInput.value = quantity.toString();
                updateTotalPrice(this);
            });
        }); // Hàm cập nhật tổng giá
        function updateTotalPrice(button) {
            const row = button.closest('.row-item');
            const priceElement = row.querySelector('.item-price');
            const quantityInput = row.querySelector('.item-quantity');
            const totalPriceElement = row.querySelector('.total-price');
            const price = parseInt(priceElement.textContent.replace('₫', '').replace(',', ''));
            const quantity = parseInt(quantityInput.value);
            const totalPrice = price * quantity;
            totalPriceElement.textContent = totalPrice.toLocaleString() + '₫';
            updateCartTotal();
        } // Hàm cập nhật tổng giá của giỏ hàng
        function updateCartTotal() {
            const rowItems = document.querySelectorAll('.row-item');
            let cartTotal = 0;
            rowItems.forEach(row => {
                const totalPriceElement = row.querySelector('.total-price');
                const totalPrice = parseInt(totalPriceElement.textContent.replace('₫', '').replace(',', ''));
                cartTotal += totalPrice;
            });
            const cartTotalElements = document.querySelectorAll('.cart-checkout .total-price');
            cartTotalElements.forEach(element => {
                element.textContent = cartTotal.toLocaleString() + '₫';
            });
        }
    }
)

