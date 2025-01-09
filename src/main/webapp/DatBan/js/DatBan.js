document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('booking-form');
    const submitButton = document.getElementById('submit-button');
    const confirmationPopup = document.getElementById('confirmation-popup');
    const overlay = document.getElementById('overlay');
    const radioGroup = document.querySelectorAll('input[name="orderChoice"]');
    const exitButton = document.getElementById('exit-button');
    const continueButton = document.getElementById('continue-button');
    const inputs = Array.from(form.querySelectorAll('input, select'));
    const loadingOverlay = document.getElementById('loading-overlay'); // Lấy overlay loading

    let isFormValid = false; // Cờ kiểm tra trạng thái form

    // Kiểm tra form đã nhập đủ thông tin chưa
    const checkFormValidity = () => {
        isFormValid = inputs.every(input => input.value.trim() !== '');
        submitButton.classList.toggle('enabled', isFormValid);
        submitButton.disabled = !isFormValid;
    };

    // Lắng nghe sự kiện thay đổi của form
    inputs.forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    // Hiển thị popup và overlay khi nhấn "Tiếp tục"
    submitButton.addEventListener('click', (event) => {
        event.preventDefault(); // Dừng việc gửi form trực tiếp
        if (isFormValid) {
            confirmationPopup.classList.add('active');
            overlay.classList.add('active'); // Hiển thị lớp phủ
        }
    });

    // Kích hoạt nút "Tiếp tục" trong popup khi chọn radio
    radioGroup.forEach(radio => {
        radio.addEventListener('change', () => {
            continueButton.disabled = false;
            continueButton.classList.add('enabled');
        });
    });

    // Đóng popup và overlay khi nhấn "Thoát"
    exitButton.addEventListener('click', () => {
        confirmationPopup.classList.remove('active');
        overlay.classList.remove('active'); // Ẩn lớp phủ
    });

    // Xử lý logic khi nhấn "Tiếp tục" trong popup
    continueButton.addEventListener('click', () => {
        const selectedOption = document.querySelector('input[name="orderChoice"]:checked');
        if (selectedOption) {
            // Ẩn popup và overlay khi bắt đầu quá trình loading
            confirmationPopup.classList.remove('active');
            overlay.classList.remove('active');

            // Hiển thị overlay loading
            loadingOverlay.style.display = 'flex';

            // Giả lập quá trình xử lý trong 3 giây
            setTimeout(() => {
                loadingOverlay.style.display = 'none'; // Ẩn loading

                // Thực hiện kiểm tra đặt bàn
                if (selectedOption.value === 'wantOrder') {
                    alert('Bạn đã chọn đặt bàn!'); // Thông báo muốn đặt bàn
                } else {
                    alert('Bạn đã chọn không muốn đặt bàn!'); // Thông báo không đặt bàn
                }

                form.submit(); // Gửi form
            }, 3000); // Đợi 3 giây
        } else {
            alert('Vui lòng chọn một tùy chọn trước khi tiếp tục.');
        }
    });
});
