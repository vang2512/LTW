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

            if (JSON.stringify(contentId) === JSON.stringify('analyticsContent')) {
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

    // Hiển thị bảng khách hàng trang quản lí người dùng
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

    // Hiển thị bảng nội dung trang phân tích
    const usersTable = document.getElementById('users-table').getElementsByTagName('tbody')[0];

    function handleUsersTableEvent(event) {
        users.forEach(user => {
            const tr = document.createElement('tr');
            const trContent = `
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
            `;
            tr.innerHTML = trContent;
            usersTable.appendChild(tr);
        });
    }

    handleUsersTableEvent();

});
