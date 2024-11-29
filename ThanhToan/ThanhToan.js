
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
const formFields = document.querySelectorAll(".checkout-form input");
const orderButton = document.querySelector(".order-btn");

function checkFormCompletion() {
    let allFieldsFilled = true;

    formFields.forEach(field => {
        if (!field.value.trim()) {
            allFieldsFilled = false;
        }
    });
    orderButton.disabled = !allFieldsFilled;
    orderButton.classList.toggle('active', allFieldsFilled);
}
formFields.forEach(field => {
    field.addEventListener('input', checkFormCompletion);
});
checkFormCompletion();