const form = document.getElementById('booking-form');
const submitButton = document.getElementById('submit-button');
const modalOverlay = document.getElementById('modal-overlay');
const cancelButton = document.querySelector('.modal-content .cancel-button');
const continueButton = document.querySelector('.modal-content button:last-child'); // Lấy nút Tiếp tục

// Lắng nghe sự kiện input để kích hoạt nút Tiếp tục
form.addEventListener('input', function() {
  const isValid = form.checkValidity();
  if (isValid) {
    submitButton.classList.add('enabled');
  } else {
    submitButton.classList.remove('enabled');
  }
});
// Khi nhấn nút Tiếp tục, hiển thị modal
submitButton.addEventListener('click', function() {
  if (submitButton.classList.contains('enabled')) {
    modalOverlay.style.display = 'flex';
    // Đặt nút Thoát sáng lên và nút Tiếp tục mờ đi khi modal xuất hiện
    cancelButton.style.opacity = 1;
    cancelButton.disabled = false;
    continueButton.style.opacity = 0.5;
    continueButton.disabled = true;
  }
});

// Đóng modal
function closeModal() {
  modalOverlay.style.display = 'none';
}
// Lắng nghe sự kiện chọn lựa trong modal
document.querySelectorAll('input[name="order-choice"]').forEach(function(input) {
  input.addEventListener('change', function() {
    const selectedOption = document.querySelector('input[name="order-choice"]:checked');

    // Khi có lựa chọn, làm sáng nút Tiếp tục và làm mờ nút Thoát
    if (selectedOption) {
      continueButton.disabled = false;
      continueButton.style.opacity = 1;
      cancelButton.style.opacity = 0.5;
      cancelButton.disabled = true;
    } else {
      // Khi không có lựa chọn nào, làm sáng nút Thoát và làm mờ nút Tiếp tục
      continueButton.disabled = true;
      continueButton.style.opacity = 0.5;
      cancelButton.style.opacity = 1;
      cancelButton.disabled = false;
    }
  });
});
// Khi nhấn Tiếp tục, hiển thị thông báo và đóng modal
function proceedOrder() {
  const selectedOption = document.querySelector('input[name="order-choice"]:checked');
  if (selectedOption) {
    alert(`Bạn đã chọn: ${selectedOption.value}`);
    closeModal();
  }
}
// Khi nhấn Thoát, đóng modal mà không làm gì
function exit() {
  closeModal();
}
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

