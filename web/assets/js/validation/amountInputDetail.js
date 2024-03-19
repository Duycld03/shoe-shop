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
	const colorElement = document.querySelector('input[type="radio"].color:checked');
	const size = document.querySelector("#size").value;
	const quantity = document.querySelector("#amountInput").value;
	let color = "";
	if (!colorElement) {
		message("error", "You haven't chosen a color yet", "Please choose color");
		return;
	}
	color = colorElement.value
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
			message("success", response.success)
		},
		error: function (response) {
			const res = response.responseJSON
			message("error", res.error)
		}
	});
}

function handleSizeChange(productId, e) {
	$.ajax({
		url: '/product',
		type: 'POST',
		data: {
			getColorBySize: "true",
			size: e.value,
			productId: productId
		},
		success: function (response) {
			const json = JSON.parse(response)
			const data = json.data
			console.log(data)
			if (data) {
				let colorHTML = ""
				data.forEach((variant) => {
					colorHTML += `<label class="color-label bg-${variant.color}-500 rounded-full w-7 h-7 border-3 border-transparent transition duration-200 ease-in-out" for="${variant.color}" onclick="selectColor(this)" onmouseenter = "this.style.border= '3px solid #40BFFF';" onmouseout = "this.style.border = '0px solid transparent';" > </label> <input class="color" hidden type="radio" name="color" id="${variant.color}" value="${variant.color}">`
				})
				document.querySelector("#color").innerHTML = colorHTML
			}
		},
		error: function (response) {
			message("error", "Get Color Failed!")
		}
	});

}

function handleChangeImage(e) {
	const img = document.querySelector("#primary-image")
	img.src = e.src
}
function backToPrimaryImage() {
	const img = document.querySelector("#primary-image")
	const dataSrc = img.getAttribute("data-src")
	const imageSrc = `/assets/img/products/${dataSrc}`
	img.src = imageSrc
}
