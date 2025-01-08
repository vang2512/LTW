document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("signUp-form");
    const inputs = form.querySelectorAll("input");
    const submitButton = document.getElementById("submitButton");

    const checkInputs = () => {
        let allFilled = true;

        inputs.forEach((input) => {
            if (input.value.trim() === "") {
                allFilled = false;
            }
        });

        if (allFilled) {
            submitButton.disabled = false;
            submitButton.classList.add("enabled");
        } else {
            submitButton.disabled = true;
            submitButton.classList.remove("enabled");
        }
    };

    inputs.forEach((input) => {
        input.addEventListener("input", checkInputs);
    });
});


