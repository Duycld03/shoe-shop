function loadMore() {
    const productBox = document.querySelector("#products")
    const offset = document.querySelectorAll("#products > .product").length

    $.ajax({
        url: "/loadMore",
        type: 'POST',
        data: { offset: offset },
        success: function (response) {
            const products = response.products
            const productCount = response.productCount
            const totalProduct = offset + products.length
            if (totalProduct >= productCount) {
                document.querySelector("#loadMore").style.display = 'none';
            }
            let productsHTML = ""
            products.forEach(product => {
                productsHTML += `<div class="product shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer"> <div> <div><img src="assets/img/products/${product.primaryImage.imageURL}" alt="" class="h-[150px] md:h-[270px] w-full"> </div> </div> <div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4"> <h3 class="text-base font-bold text-[#223263]">${product.productName}</h3> <p class="text-sm md:text-base">${product.description}</p> <div class="flex justify-between items-center"> <div> <span class="text-[#40BFFF] font-bold text-lg">$${product.price - product.price * (product.discount / 100)}</span> </div> <div class="flex flex-col md:flex-row"> <span class="text-[#9098B1] line-through text-sm md:text-base">$${product.price}</span> <span class="text-[#FB7181] font-bold text-sm md:text-base">${product.discount}% Off</span> </div> </div> </div></div>`
            });
            productBox.innerHTML += productsHTML
        },
        error: function (xhr, status, error) {
            console.error('Error loading products:', error);
        }
    });
}