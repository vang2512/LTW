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
                <td class="${order.status === 'Declined' ? 'danger' : order.status === 'Pending' ? 'warning' : 'primary'}">${order.status}</td>
                <td class="primary">Details</td>
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
});
