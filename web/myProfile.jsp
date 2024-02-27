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
        <div class=" md:flex-wrap w-full h-auto md:flex md:justify-evenly md:my-4">
        <!-- Main Contail profile -->
        <div class="md:w-1/4 w-full">
            <div
                class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
                <div class="flex gap-3 items-center font-medium text-xl">
                    <i class='bx bx-info-circle'>
                    </i>
                    <a href="#" class="font-medium text-xl">
                        Profile information
                    </a>
                </div>
                <div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
                </div>
            </div>
            <div
                class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
                <div class="flex gap-3 items-center font-medium text-xl">
                    <i class='bx bx-shopping-bag'></i>
                    <a href="#" class="font-medium text-xl">
                        Order History

                    </a>
                </div>
                <div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
                </div>
            </div>
            <div
                class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
                <div class="flex gap-3 items-center font-medium text-xl">
                    <i class='bx bx-home-alt-2'></i>
                    <a href="#" class="font-medium text-xl">
                        Address
                    </a>
                </div>
                <div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
                </div>
            </div>
            <div
                class="flex justify-between items-center md:py-3 md:px-2 mb-3 py-1 bg-white border-2 border-sky-400 rounded-xl hover:bg-sky-400 hover:text-white transition-all duration-200">
                <div class="flex gap-3 items-center font-medium text-xl">
                    <i class='bx bx-log-out'></i>
                    <a href="/auth?logout=1" class="">
                        Log Out
                    </a>
                </div>
                <div class="row_Icon text-2xl"> <i class='bx bx-right-arrow-alt'></i>
                </div>
            </div>

        </div>

        <div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5">
            <!-- Profile Icon -->
            <section class="bg-[#40BFFF] rounded-t-2xl	 flex gap-2 items-center">
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
                <button class="Update_Profile  bg-sky-400  text-white font-bold md:text-xl  p-2 rounded-lg">Update
                    Profile</button>

            </section>
        </div>
        <!-- address infor -->
        <div class="h-auto  md:w-3/5 rounded-2xl bg-gray-100 grid md:gap-8 gap-5 px-10 py-10">
            <div class="Adress-Header md:text-3xl md:flex justify-between items-center">
                <div>My address</div>
                <button class="bg-sky-400 text-white p-3 rounded-3xl md:text-xl">Add new address</button>
            </div>
            <div class="border-t border-sky-400 w-full"></div>

            <div class="Adress-body md:grid md:grid-cols-1 gap-4">
                <div class="text-2xl">Address List</div>
                <div class="User-function md:flex justify-between">
                    <div class="md:flex md:gap-2">
                        <p class="">Đoàn Thanh Phúc</p>
                        <div class="font-light border-2 w-28 border-sky-400 rounded-2xl"><i class='bx bx-star'></i>
                            <span>Primary</span>
                        </div>
                    </div>
                    <div class="flex items-center font-light text-sky-700">
                        <a href="#" class="pr-4">Update</a>
                        <div class="border-l border-gray-400 h-6"></div>
                        <a href="#" class="pl-4">Delete</a>
                    </div>
                    
                </div>
                <div class="Adress font-light">
                    <div class="City">Đồng Tháp</div>
                    <div class="Adress-detail">Khu dân cư Bình Nhựt, Đường F11, nhà trọ Hoàng Anh 3 , Võ Văn Kiệt, Long
                        Hòa, Bình Thủy, Cần
                        Thơ, Quận Bình Thuỷ, Cần Thơ</div>
                </div>

            </div>
        </div>
    </div>
        <%@include file="footer.jsp" %>
    </body>

</html>