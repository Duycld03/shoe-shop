<%-- Document : filterProduct Created on : Feb 2, 2024, 7:01:51 PM Author : Doan Thanh Phuc - CE170580 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<title>Filter</title>
		<link rel="stylesheet" href="/assets/css/Price_Range.css" />
		<%@include file="/Components/head.jsp" %>
		<script src="/assets/js/filterProduct.js"></script>
	</head>

	<body class="m-0">
		<%@include file="/Components/header.jsp" %>
		<div
			class=" grid grid-cols-1 gap-4 mx-2 md:flex md:w-full md:justify-between mt-[20px] h-auto mt-[20px] md:my-[40px] my-0">
			<div class="slide-bar md:w-[25%]  md:ml-[50px] md:mr-0">
				<!-- Price range -->
				<div
					class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] md:mb-8 md:pl-6 bg-[#F6F7F8] pb-[10px]  h-auto w-full mb-3">
					<div class="custom-wrapper w-full md:pr-[25px] md:pb-[40px] md:left-[63px] mx-0 md:mx-1">
						<div class="price-input-container w-full ">
							<p class=" font-bold md:text-[30px] md:mb-6 pt-1 text-xl">Price</p>
							<div class="flex md:justify-between  w-full items-center">
								<p class="  md:mb-6 md:text-xl font-medium text-[15px]">Range:</p>
								<div
									class="price-input flex items-center md:items-center mb-3 mt-2 md:mb-[22px] md:w-[60%]">
									<input type="number" onchange="filter()"
										   class="min-input w-14 mx-5  md:text-[20px] md:w-[75px] md:h-[30px] md:mx-1  border rounded-md"
										   value="0">
									<p class="md:font-medium  text-sm md:mx-2 items-center md:text-[20px]">to
									</p>
									<input type="number" onchange="filter()"
										   class="max-input w-14 mx-5 md:text-[20px] md:w-[75px] md:h-[30px] md:mx-1  border rounded-md"
										   value="10000">
								</div>
							</div>
							<div
								class="slider-container  h-[3px] md:h-[5px] relative bg-[#e4e4e4] rounded-[5px] w-auto">
								<div
									class="price-slider h-full left-0 right-0 absolute rounded-[5px] bg-[#05a3e7]">
								</div>
							</div>
						</div>
						<!-- Slider -->
						<div class="range-input relative">
							<input onchange="filter()" id="min-range" type="range" class="min-range " min="0" max="10000" value="0" step="1">
							<input onchange="filter()" id="max-range" type="range" class="max-range" min="0" max="10000" value="10000" step="1">
						</div>
					</div>
				</div>

				<div
					class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] pb-[15px] md:mb-8 md:pl-6 bg-[#F6F7F8] h-auto w-full mb-3">
					<p class=" font-bold mb-3 md:text-[30px] md:mb-6 pt-1 text-xl">Color</p>
					<div class="flex justify-evenly items-center md:mt-10">
						<c:forEach var="color" items="${colors}">
							<label class="color-label bg-${color}-500 rounded-full w-7 h-7 border-3 border-transparent transition duration-200 ease-in-out" for="${color}" onclick="selectColor(this)"
								   onmouseenter="this.style.border= '3px solid #40BFFF';"
								   onmouseout="this.style.border = '0px solid transparent';"></label>
							<input class="color" hidden onchange="filter()" type="radio" name="color" id="${color}" value="${color}">
						</c:forEach>

					</div>
				</div>
				<!-- Brand box -->
				<div
					class="Hot-deal-box md:pt-[1.5rem] md:pr-[1.491rem] md:pb-[1rem] md:mb-8 md:pl-6 bg-[#F6F7F8] pb-2 pb:10px mb-3 w-full">
					<p class=" font-bold md:text-[30px] md:mb-6 pt-1 text-xl">Brand</p>
					<div class="hot-deal-content font-light text-sm md:text-[1.2rem]">
						<div>
							<c:forEach items="${brandWithAmount}" var="brand">
								<label for="${brand.brandId}" onclick="selectBrand(this)"
									   class="flex justify-between  md:text-[20px] px-[5px] md:mb-3 hover:text-[#40BFFF]  transition-all duration-200 ease-in hover:cursor-pointer brand-label">
									<span class="">${brand.brandName}</span>
									<span class="">${brand.amount}</span>
								</label>
								<input hidden type="radio" name="brand" onchange="filter()" class="brand" value="${brand.brandId}" id="${brand.brandId}"/>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
			<div class="Product-bar col-auto md:w-[70%]  md:mx-10 ">
				<div
					class="Show-Product-bar bg-[#40BFFF] text-white md:flex md:h-auto md:mb-7 pb-[20px] mb-5 md:block hidden ">
					<div class="md:pl-[100px] pt-3 md:pt-[50px] md:w-full pl-5 relative">
						<div class="md:text-4xl text-xl  font-[800] md:mb-3">
							Adidas Men Running
							<br />
							Sneakers
						</div>
						<p class="font-[400] md:text-[20px] text-[10px]">Performance and design. Taken right to
							the edge.
						</p>
						<div class="md:mt-[50px] mt-[30px] ">
							<p class="text-[15px] font-medium"><span class="underline decoration-2">SHOP</span>
								NOW</p>
						</div>
					</div>
					<div class="w-full md:relative">
						<img src="/assets/img/big_shoe.png"
							 class="md:w-[400px] w-[100px] top-[100px] md:left-[0] left-[190px] absolute md:right-[135px] md:top-[-13%]	" />
					</div>
				</div>

				<!-- Sort-item -->
				<div class="bg-[#F6F7F8] md:flex md:justify-between w-full h-auto md:mb-7 px-4 mb-3 md:pb-0 pb-1 ">
					<div class="flex md:h-full md:py-[15px] md:w-[60%] md:w-[70%] items-center text-[10px] md:text-[20px] pt-2">
						<p id="product-count"></p>
					</div>
					<div class="flex items-center">
						<input type="text" id="search" oninput="filter()"
							   class="h-4 md:h-10 w-full md:w-[300px] outline-none border-2 border-[#BCDDFE] border-r-0 p-4"
							   placeholder="Search...">
						<button type="button"
								class="text-white text-sm md:text-sm font-semibold bg-[#40BFFF] w-[80px] md:w-16 h-[35px] md:h-10">Search</button>
					</div>
				</div>
				<!-- List product -->
				<div class="Product-list">
					<div id="products" class="grid md:grid-cols-3 grid-cols-2 gap-4 md:mb-[30px] mb-3 md:w-full ">

					</div>
				</div>
				<div class="bg-[#F6F7F8]  w-full h-auto ">
					<div class="flex justify-center h-auto" id="pagination">
					</div>
				</div>
			</div>
		</div>
		<%@include file="/Components/footer.jsp" %>
		<script src="/assets/js/validation/priceRange.js"></script>

	</body>

</html>