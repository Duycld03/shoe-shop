document.addEventListener('DOMContentLoaded', function () {
    // Get the input element and buttons
    const amountInput = document.getElementById('amountInput');
    const subtractBtn = document.getElementById('subtractBtn');
    const addBtn = document.getElementById('addBtn');

    // Add click event listener to the subtract button
    subtractBtn.addEventListener('click', function () {
        // Get the current value and decrement by 1
        let currentValue = parseInt(amountInput.value, 10) || 0;
        currentValue = Math.max(currentValue - 1, 1);

        // Update the input value
        amountInput.value = currentValue;
    });

    // Add click event listener to the add button
    addBtn.addEventListener('click', function () {
        // Get the current value and increment by 1
        let currentValue = parseInt(amountInput.value, 10) || 0;
        currentValue++;

        // Update the input value
        amountInput.value = currentValue;
    });
});