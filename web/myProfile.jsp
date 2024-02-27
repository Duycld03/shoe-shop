<%-- Document : myProfile Created on : Feb 27, 2024, 8:58:28 AM Author : Doan Thanh Phuc - CE170580 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <title>My profile</title>
        <%@include file="head.jsp" %>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    </head>

    <body>
        <%@include file="header.jsp" %>
        <div 
            class="md:w-2/4 w-full my-4 h-auto md:m-auto  max-w-md rounded-2xl md:my-4 md:mx-auto bg-gray-100 grid gap-8">
            <!-- Profile Icon -->
            <c:set var="c" value="${Cus}"/>
            <c:set var="ad" value="${address}"/>
            
            <section class="bg-[#40BFFF] rounded-t-2xl	 flex gap-2 items-center">
                <div class="h-auto text-white text-7xl"><i class=' bx bxs-user-circle'></i></div>
                <div class="Profile_Name text-white md:font-bold md:text-xl">${c.getUsername()} ${error}</div>
            </section>
            <!-- Profile information -->
            <section class="md:px-3 px-2 w-full grid gap-6">
                <div class="FullName flex justify-between">
                    <div class="FullName_Incon flex gap-3 items-center">
                        <i class='bx bx-user md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">Full Name</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${c.getFullname()}
                    </div>
                </div>
                <div class="Email flex justify-between">
                    <div class="FullName_Incon flex gap-3 items-center">
                        <i class='bx bx-envelope
                           md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">Email</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${c.getEmail()}
                    </div>
                </div>
                <div class="FullName flex justify-between">
                    <div class="FullName_Incon flex gap-3 items-center">
                        <i class='bx bx-phone
                           md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">Phone Number</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${c.getPhoneNumber()}
                    </div>
                </div>
                <div class="FullName flex justify-between">
                    <div class="FullName_Incon flex gap-3 items-center">
                        <i class='bx  bx-lock-alt
                           md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">Password</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${c.getPassword()}
                    </div>
                </div>
                <div class="FullName flex justify-between">
                    <div class="FullName_Incon flex gap-3 items-center">
                        <i class='bx  bx-buildings
                           md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">City</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${ad.getCity()}
                    </div>
                </div>
                <div class="FullName grid grid-cols-1 gap-3 items-center">
                    <div class="FullName_Incon flex gap-3 ">
                        <i class='bx bx-home-alt-2
                           md:text-2xl text-sky-500'></i>
                        <div class="FullName_Content md:text-sm font-bold">Adress</div>
                    </div>
                    <div class="FullName_Content md:text-sm  font-light text-gray-500">
                        ${ad.getAddressDetail()}
                    </div>
                </div>
            </section>
            <!-- button -->
            <section class="w-full h-auto flex justify-center  gap-5 md:pb-5 pb-4">
                <button class="Update_Profile bg-[#40BFFF] text-white font-bold md:text-xl  p-2 rounded">Update
                    Profile</button>
                <button class="Delect_Profile bg-[#40BFFF] text-white font-bold md:text-xl  p-2 rounded">Delete
                    Forever</button>
            </section>
        </div>
        <%@include file="footer.jsp" %>
    </body>

</html>