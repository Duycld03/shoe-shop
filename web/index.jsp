<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="head.jsp" %>
		<title>Document</title>
</head>

<body>
	<!-- header -->
	<%@include file="header.jsp" %>

		<!-- banner -->
		<section class="relative">
			<img src="assets/img/banner.jpg" alt="" class="w-full">
			<div
				class="absolute bottom-1/2 translate-y-1/2 left-12 md:left-24 text-2xl md:text-6xl text-white font-bold">
				<p class="md:mb-5">Super Flash Safe</p>
				<p>50% Off</p>
			</div>
		</section>


		<!-- flash sale -->
		<% 
			ProductDAO pDAO = new ProductDAO(); 
		%>
		<div class="hidden md:mx-28 md:flex -mt-20 mb-16">
			<div class="md:relative w-1/3 hover:cursor-pointer">
				<img src="assets/img/products/image Product1.jpg" alt="">
				<div class="absolute top-4 flex justify-between mx-8">
					<p class="text-xl font-bold text-ellipsis overflow-hidden text-[#223263]">FS - Nike Air Max 270
						React
						asdf adf asdf
						asfd
					</p>
					<p class="text-3xl font-bold text-[#40BFFF]">$299,43</p>
				</div>
				<div class="absolute bottom-4 flex items-center text-lg space-x-2 right-1/2 translate-x-1/2">
					<span class="text-[#9098B1] line-through">$534,33</span>
					<span class="text-[#FB7181] font-bold">24% Off</span>
				</div>
			</div>
			<div class="md:relative w-1/3 hover:cursor-pointer">
				<img src="assets/img/products/image Product1.jpg" alt="">
				<div class="absolute top-4 flex justify-between mx-8">
					<p class="text-xl font-bold text-ellipsis overflow-hidden text-[#223263]">FS - Nike Air Max 270
						React
						asdf adf asdf
						asfd
					</p>
					<p class="text-3xl font-bold text-[#40BFFF]">$299,43</p>
				</div>
				<div class="absolute bottom-4 flex items-center text-lg space-x-2 right-1/2 translate-x-1/2">
					<span class="text-[#9098B1] line-through">$534,33</span>
					<span class="text-[#FB7181] font-bold">24% Off</span>
				</div>
			</div>
			<div class="md:relative w-1/3 hover:cursor-pointer">
				<img src="assets/img/products/image Product1.jpg" alt="">
				<div class="absolute top-4 flex justify-between mx-8">
					<p class="text-xl font-bold text-ellipsis overflow-hidden text-[#223263]">FS - Nike Air Max 270
						React
						asdf adf asdf
						asfd
					</p>
					<p class="text-3xl font-bold text-[#40BFFF]">$299,43</p>
				</div>
				<div class="absolute bottom-4 flex items-center text-lg space-x-2 right-1/2 translate-x-1/2">
					<span class="text-[#9098B1] line-through">$534,33</span>
					<span class="text-[#FB7181] font-bold">24% Off</span>
				</div>
			</div>
		</div>

		<!-- best seller -->
		<section class="md:mx-24 md:mb-24 mx-4 mb-8">
			<h1 class="font-semibold text-3xl md:text-4xl text-center my-8 md:mb-16">BEST SELLER</h1>
			<div class="grid md:grid-cols-4 md:gap-9 grid-cols-2 gap-4">
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
				<div
					class="shadow-lg rounded-sm hover:scale-105 transition-all duration-200 ease-in hover:cursor-pointer">
					<div>
						<div><img src="assets/img/products/image Product2.jpg" alt=""
								class="h-[150px] md:h-[270px] w-full">
						</div>
					</div>
					<div class="md:mx-10 mx-4 mt-4 mb-6 space-y-4">
						<h3 class="text-base font-bold text-[#223263]">Nike Air Max 270 React</h3>
						<p class="text-sm md:text-base">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
						<div class="flex justify-between items-center">
							<div>
								<span class="text-[#40BFFF] font-bold text-lg">$299,43</span>
							</div>
							<div class="flex flex-col md:flex-row">
								<span class="text-[#9098B1] line-through text-sm md:text-base">$534,33</span>
								<span class="text-[#FB7181] font-bold text-sm md:text-base">24% Off</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<h1 class="text-xl font-medium text-[#33A0FF] text-center mt-8 underline decoration-2 hover:cursor-pointer">
				LOAD MORE</h1>
		</section>

		<!-- SNEAKERS -->
		<section class="px-4 md:pl-28 flex bg-[#40BFFF]">
			<div class="my-20 md:my-40 text-white">
				<h1 class="text-4xl md:text-6xl font-medium">Adidas Men Running Sneakers</h1>
				<p class="text-xl md:text-2xl mt-7 mb-5">Performance and design. Taken right to the edge.</p>
				<a href="#" class="underline decoration-2 text-xl font-semibold">SHOP NOW</a>
			</div>
			<div class="-mt-24 mr-4 hidden md:block">
				<img src="assets/img/big_shoe.png" alt="big_shoe" class="w-full h-full">
			</div>
		</section>

		<!-- why us -->
		<section class="my-20 md:mx-48 md:mt-24 md:mb-32 flex md:justify-between flex-wrap gap-12 justify-center mx-4">
			<div class="w-48">
				<div class="flex justify-center">
					<img src="assets/img/svg/shipping.svg" alt="">
				</div>
				<h3 class="mt-6 md:mt-14 mb-3 text-[27px] font-medium text-center">FREE SHIPPING</h3>
				<p class="text-center text-lg">Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.
				</p>
			</div>
			<div class="w-48">
				<div class="flex justify-center">
					<img src="assets/img/svg/refund.svg" alt="">
				</div>
				<h3 class="mt-6 md:mt-14 mb-3 text-[27px] font-medium text-center">100% REFUND</h3>
				<p class="text-center text-lg">Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.
				</p>
			</div>
			<div class="w-48">
				<div class="flex justify-center">
					<img src="assets/img/svg/support.svg" alt="">
				</div>
				<h3 class="mt-6 md:mt-14 mb-3 text-[27px] font-medium text-center">SUPPORT 24/7</h3>
				<p class="text-center text-lg">Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.
				</p>
			</div>
		</section>

		<!-- featured products -->
		<section class="mb-16 md:mb-32">
			<h1 class="font-semibold text-3xl md:text-4xl text-center mb-16 md:mb-20">FEATURED PRODUCTS</h1>
			<div class="mx-4 md:mx-28 grid gap-4 grid-cols-1 md:grid-cols-3 ">
				<div class="flex space-x-6">
					<div><img src="assets/img/svg/Vector.svg" alt="" class="aspect-square w-[152px]"></div>
					<div class="mb-5 flex justify-between flex-col">
						<p class="text-2xl">Blue Swade Nike Sneakers</p>
						<div class="text-xl">
							<span class="text-[#FF4858]">$499</span>
							<span class="text-[#C1C8CE] line-through">$599</span>
						</div>
					</div>
				</div>
				<div class="flex space-x-6">
					<div><img src="assets/img/svg/Vector.svg" alt="" class="aspect-square w-[152px]"></div>
					<div class="mb-5 flex justify-between flex-col">
						<p class="text-2xl">Blue Swade Nike Sneakers</p>
						<div class="text-xl">
							<span class="text-[#FF4858]">$499</span>
							<span class="text-[#C1C8CE] line-through">$599</span>
						</div>
					</div>
				</div>
				<div class="flex space-x-6">
					<div><img src="assets/img/svg/Vector.svg" alt="" class="aspect-square w-[152px]"></div>
					<div class="mb-5 flex justify-between flex-col">
						<p class="text-2xl">Blue Swade Nike Sneakers</p>
						<div class="text-xl">
							<span class="text-[#FF4858]">$499</span>
							<span class="text-[#C1C8CE] line-through">$599</span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- search-box -->
		<section class="mx-4 flex justify-center mb-24">
			<input type="text"
				class="h-8 md:h-16 w-full md:w-[500px] outline-none border-2 border-[#BCDDFE] border-r-0 p-5"
				placeholder="Search query...">
			<button
				class="text-white text-sm md:text-xl font-semibold bg-[#40BFFF] w-20 md:w-32 md:h-16">Search</button>
		</section>

		<!-- footer -->
		<%@include file="footer.jsp" %>
</body>

</html>