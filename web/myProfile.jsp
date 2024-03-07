<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<title>My profile</title>
		<%@include file="head.jsp" %>

	</head>

	<body>
		<%@include file="header.jsp" %>
		<div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
			<!-- Main Contail profile -->

			<%@include file="leftProfile.jsp" %>

			<div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5">
				<!-- Profile Icon -->
				<section class="bg-[#40BFFF] rounded-t-2xl flex gap-2 items-center">
					<div class="h-auto text-white text-8xl"><i class=' bx bxs-user-circle'></i></div>
					<div class="Profile_Name text-white md:font-bold md:text-4xl">${customer.username}</div>
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
					<button
						class="Update_Profile  bg-sky-400  text-white font-bold md:text-xl  p-2 rounded-lg">Update
						Profile</button>
				</section>
			</div>
		</div>
		<%@include file="footer.jsp" %>
	</body>

</html>