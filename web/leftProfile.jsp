<%--
    Document   : leftProfile
    Created on : Mar 7, 2024, 3:02:26 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="md:w-1/4 w-full">
	<a href="/profile"
	   class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
		<div class="flex gap-3 items-center font-medium text-xl">
			<i class='bx bx-info-circle'>
			</i>
			<span class="font-medium text-xl">
				Profile information
			</span>
		</div>
		<div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
		</div>
	</a>
	<a href="/profile/orderHistory"
	   class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
		<div class="flex gap-3 items-center font-medium text-xl">
			<i class='bx bx-shopping-bag'></i>
			<span class="font-medium text-xl">Order History</span>
		</div>
		<div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
		</div>
	</a>
	<a href="/profile/address"
	   class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
		<div class="flex gap-3 items-center font-medium text-xl">
			<i class='bx bx-home-alt-2'></i>
			<span class="font-medium text-xl">Address</span>
		</div>
		<div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
		</div>
	</a>
	<a href="/logout"
	   class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
		<div class="flex gap-3 items-center font-medium text-xl">
			<i class='bx bx-log-out'></i>
			<span class="">Log Out</span>
		</div>
		<div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
		</div>
	</a>

</div>
