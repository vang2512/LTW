document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('booking-form');
    const submitButton = document.getElementById('submit-button');
    const confirmationPopup = document.getElementById('confirmation-popup');
    const overlay = document.getElementById('overlay');
    const radioGroup = document.querySelectorAll('input[name="orderChoice"]');
    const exitButton = document.getElementById('exit-button');
    const continueButton = document.getElementById('continue-button');
    const inputs = Array.from(form.querySelectorAll('input, select'));
    const loadingOverlay = document.getElementById('loading-overlay');
    let isFormValid = false;
    const checkFormValidity = () => {
        isFormValid = inputs.every(input => input.value.trim() !== '');
        submitButton.classList.toggle('enabled', isFormValid);
        submitButton.disabled = !isFormValid;
    };
    inputs.forEach(input => {
        input.addEventListener('input', checkFormValidity);
    });

    submitButton.addEventListener('click', (event) => {
        event.preventDefault(); // Dừng việc gửi form trực tiếp
        if (isFormValid) {
            confirmationPopup.classList.add('active');
            overlay.classList.add('active'); // Hiển thị lớp phủ
        }
    });
    radioGroup.forEach(radio => {
        radio.addEventListener('change', () => {
            continueButton.disabled = false;
            continueButton.classList.add('enabled');
        });
    });
    exitButton.addEventListener('click', () => {
        confirmationPopup.classList.remove('active');
        overlay.classList.remove('active'); // Ẩn lớp phủ
    });
    continueButton.addEventListener('click', () => {
        const selectedOption = document.querySelector('input[name="orderChoice"]:checked');
        if (selectedOption) {
            confirmationPopup.classList.remove('active');
            overlay.classList.remove('active');
            loadingOverlay.style.display = 'flex';
            setTimeout(() => {
                loadingOverlay.style.display = 'none';
                if (selectedOption.value === 'noOrder') {
                    alert('Bạn đã chọn đặt bàn!');
                    form.submit();
                } else {
                    alert('Bạn đã chọn không muốn đặt bàn!');
                }
            }, 3000);
        } else {
            alert('Vui lòng chọn một tùy chọn trước khi tiếp tục.');
        }
    });
    exitButton.classList.add('enabled');
    exitButton.disabled = false;
});
//Lấy giờ và ngày đặt cho hiện tại
document.addEventListener('DOMContentLoaded', function() {
    var currentDate = new Date();

    // Cập nhật trường Ngày đặt
    var dayInput = document.getElementById('ngayDat');
    var currentDateString = currentDate.toISOString().split('T')[0];
    dayInput.setAttribute('min', currentDateString);
    dayInput.value = currentDateString;

    // Cập nhật trường Giờ đặt
    var timeInput = document.getElementById('gioDat');
    var currentTimeString = currentDate.toTimeString().split(' ')[0].substring(0, 5);
    timeInput.setAttribute('min', currentTimeString);
    timeInput.value = currentTimeString;  // Thiết lập giá trị mặc định là giờ hiện tại
});