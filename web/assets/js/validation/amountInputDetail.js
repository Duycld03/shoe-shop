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

function selectColor(e) {
	const colorElements = document.querySelectorAll(".color-label")
	colorElements.forEach((el) => {
		if (el.classList.contains("ring")) {
			el.classList.remove("ring");
		}
	})
	e.classList.add("ring")
}

function addToCart(productId) {
	const color = document.querySelector('input[type="radio"].color:checked').value;
	const size = document.querySelector("#size").value;
	const quantity = document.querySelector("#amountInput").value;
	console.log(color, size, quantity)
	$.ajax({
		url: '/addCart',
		type: 'POST',
		data: {
			addToCart: "true",
			quantity: quantity,
			size: size,
			color: color,
			productId: productId
		},
		success: function (response) {
			message("success", "Add To Cart successful!")
		},
		error: function (response) {
			message("error", "Add To Cart failed!")
		}
	});
}