<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAOs.ProductDAO" %>
<%@page import="DAOs.ProductVariantsDAO" %>
<%@page import="Models.Product" %>
<%@page import="Models.ProductVariant" %>
<%@page import="Models.Cart" %>
<!DOCTYPE html>
<html>

	<head>
		<title>Cart</title>
		<%@include file="/Components/head.jsp" %>
	</head>

	<body>
		<%@include file="/Components/header.jsp" %>
		<div class="shopping-cart">
			<div class="pl-32">
				<!-- px-4 px-lg-0 pl-32 -->
				<div class="pb-5">
					<div class="container">
						<div class="row">
							<div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

								<!-- Shopping cart table -->
								<div class="table-responsive">
									<table class="table">
										<thead>
											<c:if test="${error!=null }">
											<div class="alert alert-danger" role="alert">
												${error}
											</div>
										</c:if>
										<c:if test="${mess!=null }">
											<div class="alert alert-success" role="alert">
												${mess}
											</div>
										</c:if>



										</thead>

									</table>
								</div>
								<!-- End -->
							</div>
						</div>
						<table class="min-w-full divide-y divide-gray-200 px-8 text-center">
							<thead>
								<tr>
									<th scope="col"
										class="px-2 py-10 text-left text-lg font-semibold ml-3">
										PRODUCT
									</th>
									<th scope="col"
										class="px-2 py-10 text-center text-lg font-semibold ">
										COLOR
									</th>
									<th scope="col"
										class="px-2 py-10 text-center text-lg font-semibold">
										SIZE
									</th>
									<th scope="col"
										class="px-4 py-10 text-lg font-semibold text-center">
										PRICE
									</th>
									<th scope="col"
										class="px-4 py-10 text-lg font-semibold text-center">
										QTY
									</th>
									<th scope="col"
										class="px-4 py-10 text-lg font-semibold text-center">
										UNIT PRICE
									</th>
									<th class="px-2 py-2">
									</th>
								</tr>
							</thead>
							<tbody class="divide-y divide-gray-200">
								<c:forEach items="${carts}" var="cart">
									<c:set var="cartItem" value="${cart}" />
									<% Cart cartItem=(Cart)pageContext.getAttribute("cartItem");
										ProductDAO productDAO=new ProductDAO();
										ProductVariantsDAO productVariantDAO=new
										ProductVariantsDAO(); ProductVariant
										productVariant=productVariantDAO.getVariantByID(cartItem.getProductVariant().getVariantId());
										Product
										product=productDAO.getProductByID(productVariant.getProductId());
									%>
									<tr>
										<td class="row">
											<div class="p-2 flex">
												<img src="/assets/img/products/<%= product.getPrimaryImage().getImageURL()%>"
													 alt="" width="70"
													 class="img-fluid rounded shadow-sm">
												<div
													class="ml-3 d-inline-block align-middle flex items-center">
													<a class="text-dark d-inline-block">
														<%= product.getProductName()%>
													</a>
												</div>
											</div>
										</td>
										<td class="align-middle">
											${cart.productVariant.color}
										</td>
										<td class="align-middle">
											${cart.productVariant.size}
										</td>
										<td id="totalPrice${cart.cartId}"
											class="align-middle">
											$${cart.totalPrice}
										</td>
										<td class="align-middle">
											<div class="flex justify-center items-center">
												<button class="btnSub text-2xl"
														onclick="decreaseQuantity('${cart.cartId}')">
													<i class='bx bx-minus'></i>
												</button>
												<input id="${cart.cartId}" type="number"
													   value="${cart.quantity}"
													   class="text-center border-none outline-none w-[75px] h-100"
													   onchange="updateQuantity(event, '${cart.cartId}')" />
												<button class="btnAdd text-2xl"
														onclick="increaseQuantity('${cart.cartId}')">
													<i class='bx bx-plus'></i>
												</button>
											</div>
										</td>
										<td class="align-middle">
											$${cart.totalPrice / cart.quantity}
										</td>
										<td class="align-middle">
											<a href="#"
											   onclick="messageConfirm('Delete product from cart!', () => {
														   window.location.href = '/cartManagement/delete?cartId=${cart.cartId}'
													   })"
											   class="text-red-500 text-3xl">
												<i class='bx bx-x'></i>
											</a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

					<div class="flex">
						<div class="max-w-xs w-full py-14">
							<div class="max-w-xs mx-auto">
								<table class="w-full border-collapse border border-gray-300">
									<tbody>
										<tr>
											<td class="p-3 border border-gray-300 pr-8">
												Shipping fee
											</td>
											<td class="p-3 border border-gray-300">
												Free
											</td>
										</tr>
										<tr>
											<td class="p-3 border border-gray-300 pr-8">
												Coupon
											</td>
											<td class="p-3 border border-gray-300">
												No
											</td>
										</tr>
										<tr>
											<td class="p-3 border border-gray-300 pr-8">
												Payment Method
											</td>
											<td class="p-3 border border-gray-300">
												<select name="paymentMethod" id="paymentMethod"
														value="VNPay">
													<option value="VNPay">VNPay</option>
													<option value="COD">COD</option>
												</select>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td
												class="p-3 border border-gray-300 font-bold pr-8">
												Total
											</td>
											<td id="total"
												class="p-3 border border-gray-300 font-bold">
												$${total}</td>
										</tr>
									</tfoot>
								</table>
								<div class="flex justify-center mt-4">
									<button
										class="bg-blue-500 hover:bg-blue-700 text-white font-bold px-4 py-2"
										onclick="checkout()" type="button">
										Check out
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/Components/footer.jsp" %>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
	<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
	<script>
											function increaseQuantity(inputID) {
												let inputQuantity = $("#" + inputID)
												let quantity = Number(inputQuantity.val())
												inputQuantity.val(quantity + 1)
												inputQuantity.trigger('change')
											}
											function decreaseQuantity(inputID) {
												let inputQuantity = $("#" + inputID)
												let quantity = Number(inputQuantity.val())
												if (quantity > 1) {
													inputQuantity.val(quantity - 1)
												}
												inputQuantity.trigger('change')
											}
											function updateQuantity(e, cartId) {
												let quantity = e.target.value;
												if (quantity <= 0) {
													quantity = 1
												}
												$.ajax({
													url: '/cartManagement',
													type: 'POST',
													data: {
														updateQuantity: "true",
														cartId: cartId,
														quantity: quantity
													},
													success: function (response) {
														const data = JSON.parse(response)
														if (data.status == "success") {
															reload()
														}
													},
													error: function (response) {
														const data = JSON.parse(response.responseJSON)
														message("error", data.error)
													}
												});
											}
											function checkout() {
												const total = document.querySelector("#total").innerText
												const paymentMethod = document.querySelector("#paymentMethod").value
												$.ajax({
													type: "POST",
													url: "/checkout",
													data: {
														paymentMethod: paymentMethod,
														amount: parseFloat(total.substring(1)),
														customerId: "${customer.customerId}"
													},

													dataType: 'JSON',
													success: function (x) {
														if (x.paymentMethod == "VNPay") {
															if (x.code === '00') {
																if (window.vnpay) {
																	vnpay.open({width: 768, height: 600, url: x.data});
																} else {
																	location.href = x.data;
																}
															} else {
																alert(x.Message);
															}
														} else {
															window.location.href = "/"
														}
													},
													error: function (e) {
														console.log(e)
													}
												});
											}
											function reload() {
												$.ajax({
													url: '/cartManagement',
													type: 'POST',
													data: {
														reload: "true",
													},
													success: function (response) {
														const {carts, total} = JSON.parse(response)
														carts.forEach(cart => {
															document.querySelector("#totalPrice" + cart.cartId).innerText = "$" + cart.totalPrice
														})
														document.querySelector("#total").innerText = "$" + total
													},
													error: function (response) {
														const data = JSON.parse(response.responseJSON)
														message("error", data.error)
													}
												});
											}
	</script>
</body>

</html>

</html>