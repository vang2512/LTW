
<!--JS Header-->
const searchIcon = document.getElementById('search-icon');
const searchInput = document.getElementById('search-input');
const clearBtn = document.getElementById('clear-btn');

searchIcon.addEventListener('click', function (event) {
    this.classList.toggle('active'); // Thêm hoặc gỡ lớp active
    if (!this.classList.contains('active')) {
        searchInput.value = '';
    }
});
searchInput.addEventListener('click', function (event) {
    event.stopPropagation();
});
clearBtn.addEventListener('click', function (event) {
    searchIcon.classList.remove('active');
    searchInput.value = '';
});
<!--JS Payment-->
const formFields = document.querySelectorAll(".checkout-form input, .check_box input");
const orderButton = document.querySelector(".order-btn");
const termsCheckbox = document.getElementById("terms");

function checkFormCompletion() {
    let allFieldsFilled = true;
    formFields.forEach(field => {
        if (field.type !== "checkbox" && !field.value.trim()) {
            allFieldsFilled = false;
        }
    });
    if (!termsCheckbox.checked) {
        allFieldsFilled = false;
    }
    orderButton.disabled = !allFieldsFilled;
    orderButton.classList.toggle('active', allFieldsFilled);
}

formFields.forEach(field => {
    field.addEventListener('input', checkFormCompletion);
});
termsCheckbox.addEventListener('change', checkFormCompletion);
checkFormCompletion();
