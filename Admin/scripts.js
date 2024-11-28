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
});

Orders.forEach(order => {
    const tr = document.createElement('tr');
    const trContent = `
        <td>${order.productName}</td>
        <td>${order.productNumber}</td>
        <td>${order.paymentStatus}</td>
        <td class="${order.status === 'Pending' ? 'danger' : order.status === 'Deposit' ? 'warning' : 'primary'}">${order.status}</td>
        <td class="primary">Details</td>
    `;
    tr.innerHTML = trContent;
    document.querySelector('table tbody').appendChild(tr);
});