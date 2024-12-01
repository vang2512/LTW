<!--JS Set a table-->
const form = document.getElementById('booking-form');
const submitButton = document.getElementById('submit-button');

form.addEventListener('input', function() {
  const isValid = form.checkValidity();
  if (isValid) {
    submitButton.classList.add('enabled');
  } else {
    submitButton.classList.remove('enabled');
  }
});

submitButton.addEventListener('click', function() {
  if (submitButton.classList.contains('enabled')) {
    document.getElementById('modal-overlay').style.display = 'flex';
  }
});

function closeModal() {
  document.getElementById('modal-overlay').style.display = 'none';
}

document.querySelectorAll('input[name="order-choice"]').forEach(function(input) {
  input.addEventListener('change', function() {
    const continueButton = document.querySelector('.modal-content button');
    continueButton.disabled = false;
    continueButton.style.opacity = 1;
  });
});

function proceedOrder() {
  const selectedOption = document.querySelector('input[name="order-choice"]:checked');
  if (selectedOption) {
    alert(`Bạn đã chọn: ${selectedOption.value}`);
    closeModal();
  }
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

