<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<title>My profile</title>
		<%@include file="/Components/head.jsp" %>

	</head>

	<body>
		<%@include file="/Components/header.jsp" %>
		<div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
			<!-- Main Contail profile -->

			<%@include file="/Customer/leftProfile.jsp" %>

			<div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5">
				<!-- Profile Icon -->
				<section class="bg-[#40BFFF] rounded-t-2xl flex gap-2 items-center">
					<div class="h-auto text-white text-8xl"><i class=' bx bxs-user-circle'></i></div>
					<div class="Profile_Name text-white md:font-bold md:text-4xl">${customer.username}
					</div>
				</section>
				<!-- Profile information -->
				<section class="md:px-3 px-2 w-full grid gap-7">
					<div class="FullName flex justify-between">
						<div class="FullName_Incon flex gap-3 items-center">
							<i class='bx bx-user md:text-3xl text-sky-500'></i>
							<div class="FullName_Content md:text-xl font-bold">Full Name</div>
						</div>
						<div class="FullName_Content md:text-xl  font-light text-gray-500">
							${customer.fullname}
						</div>
					</div>
					<div class="Email flex justify-between">
						<div class="FullName_Incon flex gap-3 items-center">
							<i class='bx bx-envelope
							   md:text-3xl text-sky-500'></i>
							<div class="FullName_Content md:text-xl font-bold">Email</div>
						</div>
						<div class="FullName_Content md:text-xl  font-light text-gray-500">
							${customer.email}
						</div>
					</div>
					<div class="FullName flex justify-between">
						<div class="FullName_Incon flex gap-3 items-center">
							<i class='bx bx-phone
                               md:text-3xl text-sky-500'></i>
							<div class="FullName_Content md:text-xl font-bold">Phone Number</div>
						</div>
						<div class="FullName_Content md:text-xl  font-light text-gray-500">
							${customer.phoneNumber}
						</div>
					</div>
					<div class="FullName flex justify-between">
						<div class="FullName_Incon flex gap-3 items-center">
							<i class='bx  bx-lock-alt
                               md:text-3xl text-sky-500'></i>
							<div class="FullName_Content md:text-xl font-bold">Password</div>
						</div>
						<div class="FullName_Content md:text-xl  font-light text-gray-500">
							**********
						</div>
					</div>

				</section>
				<!-- button -->
				<section class="w-full h-auto  pb-5 md:px-2">
					<button onclick="openModal()"
							class="Update_Profile  bg-sky-400 text-white font-bold md:text-xl ml-2 p-3 rounded-lg">Update Profile</button>
				</section>
			</div>
		</div>
		<%@include file="/Components/footer.jsp" %>
		<div id="modal"
			 class="modal hidden fixed inset-0 bg-gray-500 bg-opacity-75 flex justify-center items-center">
			<!-- Modal Content -->
			<div class="bg-white rounded-lg p-8">
				<!-- Modal Header -->
				<div class="flex justify-between items-center mb-4">
					<h2 class="text-xl font-bold w-[280px] md:w-[500px]">Update Profile</h2>
					<!-- Close Button -->
					<button class="text-gray-500 hover:text-gray-700 text-3xl"
							onclick="closeModal()">&times;</button>
				</div>
				<!-- Modal Body (Form) -->
				<form action="/profile" method="POST">
					<input type="hidden" name="customerId" value="${customer.customerId}">
					<div class="mb-4">
						<label for="fullname" class="block text-gray-700 font-bold mb-2">Fullname:</label>
						<input type="text" id="fullname" name="fullname" required
							   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500" value="${customer.fullname}"
							   placeholder="Enter Fullname">
					</div>
					<div class="mb-4">
						<label for="email" class="block text-gray-700 font-bold mb-2">Email:</label>
						<input type="email" id="email" name="email" required
							   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500" value="${customer.email}"
							   placeholder="Enter Email">
					</div>
					<div class="mb-4">
						<label for="phoneNumber" class="block text-gray-700 font-bold mb-2">Phone Number:</label>
						<input type="text" name="phoneNumber" id="phoneNumber" placeholder="Enter Phone Number"
							   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500" maxlength="10" minlength="10" value="${customer.phoneNumber}"
							   pattern="[0-9]{10}" required>
					</div>
					<div class="mb-4">
						<label for="password" class="block text-gray-700 font-bold mb-2">Password:</label>
						<input type="password" id="password" name="password"
							   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:border-blue-500" minlength="5"
							   placeholder="Enter Password">
					</div>

					<!-- Submit Button -->
					<div class="flex justify-center">
						<button type="submit" name="btnSave"
								class="md:w-32 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Save</button>
					</div>
				</form>
			</div>
		</div>
		<script>
			function openModal() {
				document.getElementById('modal').classList.remove('hidden');
			}

			function closeModal() {
				document.getElementById('modal').classList.add('hidden');
			}
		</script>
	</body>

</html>