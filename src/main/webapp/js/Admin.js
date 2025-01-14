document.addEventListener('DOMContentLoaded', function () {
    const links = document.querySelectorAll('.sidebar a');
    const sections = document.querySelectorAll('.content-section');

    links.forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const contentId = this.getAttribute('data-target');

            links.forEach(link => link.classList.remove('active'));

            this.classList.add('active');

            sections.forEach(section => {
                section.classList.remove('active');
                section.style.display = 'none';
            });

            const activeSection = document.getElementById(contentId);

            if (JSON.stringify(contentId) === JSON.stringify('usersContent')) {
                activeSection.style.display = 'grid';
            } else if (JSON.stringify(contentId) === JSON.stringify('productsContent')) {
                activeSection.style.display = 'grid';
            } else if (JSON.stringify(contentId) === JSON.stringify('desksContent')) {
                activeSection.style.display = 'grid';
            } else if (JSON.stringify(contentId) === JSON.stringify('ordersContent')) {
                activeSection.style.display = 'grid';
            } else if (JSON.stringify(contentId) === JSON.stringify('analyticsContent')) {
                activeSection.style.display = 'grid';
            } else {
                activeSection.style.display = 'flex';
            }
            setTimeout(() => {
                activeSection.classList.add('active');
            }, 10); // Delay to trigger CSS transition
        });
    });

    // Hiển thị nội dung mặc định
    const defaultSection = document.getElementById('analyticsContent');
    defaultSection.style.display = 'grid';
    setTimeout(() => {
        defaultSection.classList.add('active');
    }, 10);

    /* ------------------------------------------------------------------- */
    /* ---------------- Trang phân tích ----------------*/

    // Hiển thị bảng nội dung trang phân tích
    const recentOrders = document.getElementById('recent-orders').getElementsByTagName('tbody')[0];

    function handleRecentOrdersEvent(event) {
        Orders.forEach(order => {
            const tr = document.createElement('tr');
            const trContent = `
                <td>${order.productName}</td>
                <td>${order.productNumber}</td>
                <td>${order.paymentStatus}</td>
                <td class="${order.status === 'Đã thanh toán'  ? 'success' : 'warning'}">${order.status}</td>
                <td class="primary">Chi tiết</td>
            `;
            tr.innerHTML = trContent;
            recentOrders.appendChild(tr);
        });
    }

    handleRecentOrdersEvent();

    /* ------------------------------------------------------------------- */
    /* ---------------- Trang quản lí người dùng ----------------*/

    // Hiển thị bảng khách hàng trang quản lí người dùng
    const usersTable = document.getElementById('users-table').getElementsByTagName('tbody')[0];
    const modal = document.getElementById('user-form-modal');
    const addUserBtn = document.getElementById('add-user-btn');
    const closeBtn = document.getElementsByClassName('close-btn')[0];

    function handleUsersTableEvent(event) {
        usersTable.innerHTML = '';
        users.forEach(user => {
            const tr = document.createElement('tr');
            const trContent = `
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.address}</td>
                <td>${user.phone}</td>
                <td>
                    <button>
                        <span class="success">
                            <i class="bi bi-pencil-fill"></i>
                        </sapn>
                    </button>
                    <button onclick="deleteUser(${user.number})">
                        <span class="danger">
                            <i class="bi bi-trash-fill"></i>
                        </sapn>
                    </button>
                </td>
            `;
            tr.innerHTML = trContent;
            usersTable.appendChild(tr);
        });
    }

    handleUsersTableEvent();

    // Hàm xóa người dùng
    window.deleteUser = function (number) {
        const index = users.findIndex(user => user.number === number);
        if (index !== -1) {
            users.splice(index, 1);
            handleUsersTableEvent();
        }
    };

    // Hiển thị modal khi nhấp vào nút "Thêm người dùng"
    addUserBtn.addEventListener('click', function () {
        modal.style.display = 'block';
    });
    // Đóng modal khi nhấp vào nút "X"
    closeBtn.addEventListener('click', function () {
        modal.style.display = 'none';
    });
    // Đóng modal khi nhấp ra ngoài modal
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
    // Xử lý sự kiện submit form
    const userForm = document.getElementById('user-form');
    userForm.addEventListener('submit', function (event) {
        event.preventDefault();
        // Xử lý dữ liệu form ở đây
        const newUser = {
            number: users.length + 1,
            id: document.getElementById('id').value,
            name: document.getElementById('name').value,
            email: document.getElementById('email').value,
            address: document.getElementById('address').value,
            phone: document.getElementById('phone').value
        }
        users.push(newUser);
        handleUsersTableEvent();
        modal.style.display = 'none';
    });

    /* ------------------------------------------------------------------- */
    /* ---------------- Trang quản lí sản phẩm ----------------*/

    // Hiển thị danh sách sản phẩm
    function handleProductsTableEvent() {
        const productsTable = document.getElementById('products-table').getElementsByTagName('tbody')[0];
        productsTable.innerHTML = '';
        products.forEach(product => {
            const row = productsTable.insertRow();
            row.innerHTML = `
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.type}</td>
                <td>${product.price}</td>
                <td>
                    <button onclick="editProduct(${product.number})">
                        <span class="success">
                            <i class="bi bi-pencil-fill"></i>
                        </sapn>
                    </button>
                    <button onclick="deleteProduct(${product.number})">
                        <span class="danger">
                            <i class="bi bi-trash-fill"></i>
                        </sapn>
                    </button>
                    <button onclick="infoProduct(${product.number})">
                        <span class="primary">
                            <i class="bi bi-info-circle-fill"></i>
                        </sapn>
                    </button>
                </td>
            `;
        });
    }

    handleProductsTableEvent();

    // Hàm xóa sản phẩm
    window.deleteProduct = function (number) {
        const index = products.findIndex(product => product.number === number);
        if (index !== -1) {
            products.splice(index, 1);
            handleProductsTableEvent();
        }
    };

    /* ------------------------------------------------------------------- */
    /* ---------------- Trang quản lí bàn ----------------*/

    // Hiển thị danh sách bàn
    function handleDesksTableEvent() {
        const desksTable = document.getElementById('desks-table').getElementsByTagName('tbody')[0];
        desksTable.innerHTML = '';
        desks.forEach(desk => {
            const row = desksTable.insertRow();
            row.innerHTML = `
                <td>${desk.type}</td>
                <td>${desk.space}</td>
                <td>${desk.amount}</td>
                <td>${desk.price}</td>
                <td>
                    <button onclick="editDesk(${desk.number})">
                        <span class="success">
                            <i class="bi bi-pencil-fill"></i>
                        </sapn>
                    </button>
                    <button onclick="deleteDesk(${desk.number})">
                        <span class="danger">
                            <i class="bi bi-trash-fill"></i>
                        </sapn>
                    </button>
                    <button onclick="infoDesk(${desk.number})">
                        <span class="primary">
                            <i class="bi bi-info-circle-fill"></i>
                        </sapn>
                    </button>
                </td>
            `;
        });
    }

    handleDesksTableEvent();

    // Hàm xóa bàn
    window.deleteDesk = function (number) {
        const index = desks.findIndex(desk => desk.number === number);
        if (index !== -1) {
            desks.splice(index, 1);
            handleDesksTableEvent();
        }
    };

    /* ------------------------------------------------------------------- */
    /* ---------------- Trang quản lí đơn hàng ----------------*/

    // Hiển thị dữ liệu đơn hàng từ data.js
    const ordersTable = document.getElementById('orders-table').getElementsByTagName('tbody')[0];
    orders.forEach(order => {
        const row = ordersTable.insertRow();
        row.innerHTML = `
            <td rowspan="${order.products.length}">${order.id}</td>
            <td rowspan="${order.products.length}">${order.customerName}</td>
            <td>${order.products[0].name}</td>
            <td>${order.products[0].quantity}</td>
            <td rowspan="${order.products.length}">${order.price}</td>
            <td rowspan="${order.products.length}">${order.status}</td>
            <td rowspan="${order.products.length}">
                <button onclick="editUser(${order.number})">
                    <span class="success">
                        <i class="bi bi-pencil-fill"></i>
                    </sapn>
                </button>
                <button onclick="deleteUser(${order.number})">
                    <span class="danger">
                        <i class="bi bi-trash-fill"></i>
                    </sapn>
                </button>
            </td>
        `;
        for (let i = 1; i < order.products.length; i++) {
            const productRow = ordersTable.insertRow();
            productRow.innerHTML = `
                <td>${order.products[i].name}</td>
                <td>${order.products[i].quantity}</td>
            `;
        }
    });
});
