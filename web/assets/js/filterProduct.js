function selectBrand(e) {
	const colorElements = document.querySelectorAll(".brand-label")
	colorElements.forEach((el) => {
		if (el.classList.contains("text-[#40BFFF]")) {
			el.classList.remove("text-[#40BFFF]");
		}
	})
	e.classList.add("text-[#40BFFF]")
}

function selectColor(e) {
	const colorElements = document.querySelectorAll(".color-label")
	colorElements.forEach((el) => {
		if (el.classList.contains("ring")) {
			el.classList.remove("ring");
		}
	})
	e.classList.add("ring")
}

function filter() {
	const colorElement = document.querySelector('input[type="radio"].color:checked')
	const brandElement = document.querySelector('input[type="radio"].brand:checked')
	const minPrice = document.querySelector('#min-range').value
	const maxPrice = document.querySelector('#max-range').value
	const search = document.querySelector('#search').value
	products = [...originalProduct]
	products = products.filter((product) => {
		const productPrice = product.price - (product.price * product.discount / 100)
		return productPrice >= minPrice && productPrice <= maxPrice && product.productName.toLowerCase().includes(search.toLowerCase())
	})
	if (colorElement) {
		const color = colorElement.value
		products = products.filter((product) => {
			return product.productVariants.some((variant) => variant.color == color)
		})
	}
	if (brandElement) {
		const brand = brandElement.value
		products = products.filter((product) => {
			return product.brand.brandId == brand
		})
	}
	filterProducts = products.slice(0, 9)
	loadProduct(filterProducts)
	loadPagination()
	document.querySelector("#product-count").innerText = `${products.length} Products`
}

var originalProduct = []
var products = []

getAllProduct()

function getAllProduct() {
	$.ajax({
		url: '/productFilter',
		type: 'POST',
		data: {
			getAllProduct: true
		},
		success: function (response) {
			originalProduct = JSON.parse(response)
			products = [...originalProduct]
			filter()
		},
		error: function (response) {
			message("error", "Get all product failed!")
		}
	});
}

function loadProduct(products) {
	let productHTML = ""
	products.forEach((product) => {
		productHTML += `<div onclick="redirectToDetailPage('${product.productId}')"
							class="border-solid border-2 h-full pb-[10px] md:pb-[20px] md:h-auto  rounded-[5%] relative shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
							<img src="/assets/img/products/${product.primaryImage.imageURL}" class="h-[150px] md:h-[270px] w-full" />
							<div class="text-center md:mt-2 mt-1">

								<p class="text-[10px] md:text-xl font-[700]">${product.productName}</p>
								<p class="text-[7px] md:text-[sm] font-medium md:text-base">${product.description}</p>
								<div
									class="flex justify-between px-2 pt-2 items-center md:px-[40px] md:pt-[10px]">
									<div>
										<span class="text-[#40BFFF] font-bold text-[10px] md:text-lg">$${product.price - (product.price * product.discount / 100)}</span>
									</div>
									<div class="flex flex-col md:flex-row">
										<span
											class="text-[#9098B1] line-through text-[8px] md:text-sm md:text-base">$${product.price}</span>
										<span
											class="text-[#FB7181] font-bold text-[8px] md:text-sm md:text-base">${product.discount}% Off</span>
									</div>
								</div>
							</div>
						</div>`
	})
	document.querySelector("#products").innerHTML = productHTML
}

function loadPagination() {
	let paginationHTML = ""
	const numberOfPages = Math.ceil(products.length / 9)
	for (let i = 1; i <= numberOfPages; i++) {
		paginationHTML += `<p class="${i == 1 ? "text-[#40BFFF] hover:text-white" : ""} h-full hover:bg-[#40BFFF] w-[80px] text-center py-3" onclick="loadPageNumber(${i})">${i}</p>`
	}
	document.querySelector("#pagination").innerHTML = paginationHTML
}

function loadPageNumber(n) {
	filter()
	const productItems = 9 * (n - 1)
	productPagination = products.slice(productItems, productItems + 9)

	const paginationElements = document.querySelectorAll("#pagination > p")
	const classList = ["text-[#40BFFF]", "hover:text-white"]
	paginationElements.forEach((pagination) => {
		if (pagination.classList.contains(...classList)) {
			pagination.classList.remove(...classList)
		}
	})
	paginationElements[n - 1].classList.add(...classList)

	loadProduct(productPagination)
}


