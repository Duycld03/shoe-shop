<html>

<head>
    <title>Left slide bar</title>

    <script src="assets/js/validation/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="assets/css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="assets/js/script.js"></script>

</head>

<body>
    <div class="leftSlideba shadow-lg md:w-1/5 grid md:gap-2 md:px-4 rounded-ee-xl h-auto pb-4">
        <div class="mb-4 md:mb-0">
            <a href="#" class="flex items-center space-x-2">
                <img src="assets/img/svg/Icon.svg" alt="">
                <span class="font-bold text-lg">E-Comm</span>
            </a>
        </div>
        <div class="text-3xl font-bold">Menu</div>
        <div class="border-t-2 border-black w-full my-1"></div>

        <!-- Account Management -->
        <div class="AccountManament grid md:gap-3 ">
            <div class="AccountManament-sub transition duration-200 ease-in-out hover:bg-blue-200">
                <div class="flex md:items-center md:gap-2 font-bold">
                    <i class='bx bx-user-circle md:text-3xl'></i>
                    <div class="Account_title "> Account Management </div>
                </div>
                <div class="border-t border-black w-full"></div>
            </div>
            <!-- Sub-Account Management -->
            <div class="grid md:ml-6  md:gap-2  ">
                <div class="sub_AccountM_Admin hidden transition duration-200 ease-in-out hover:bg-blue-200">
                    <div class="flex items-center gap-1">
                        <i class='bx bx-user md:text-2xl'></i>
                        <a href="#" alt="admin_Account"> Admin Management </a>
                    </div>
                    <div class="border-t border-black w-full"></div>
                </div>
                <div class="sub_AccountM_Customer hidden transition duration-200 ease-in-out hover:bg-blue-200">
                    <div class="flex items-center gap-1 ">
                        <i class='bx bx-user md:text-2xl'></i>
                        <a href="#" alt="staff_Account"> Customer Management </a>
                    </div>
                    <div class="border-t border-black w-full"></div>
                </div>
                <div class="sub_AccountM_Staff transition hidden duration-200 ease-in-out hover:bg-blue-200">
                    <div class="flex items-center gap-1 ">
                        <i class='bx bx-user md:text-2xl'></i>
                        <a href="#" alt="customer_Account"> Staff Management </a>
                    </div>
                    <div class="border-t border-black w-full"></div>
                </div>
            </div>
        </div>

        <!-- Other Sections with Hover Effect -->
        <div class="transition duration-200 ease-in-out hover:bg-blue-200">
            <div class="flex items-center gap-2 font-bold ">
                <i class='bx bx-cube-alt md:text-4xl'></i>
                <a href="#" class="Product_Manager">Product Management</a>
            </div>
            <div class="border-t border-black w-full"></div>
        </div>
        <!-- Brand Management -->
        <div class="transition duration-200 ease-in-out hover:bg-blue-200">
            <div class="flex items-center gap-2 font-bold ">
                <i class='bx bx-registered md:text-4xl'></i>
                <a href="#" class="brand_management">Brand Management</a>
            </div>
            <div class="border-t border-black w-full"></div>
        </div>
        <div class="transition duration-200 ease-in-out hover:bg-blue-200">
            <div class="flex items-center gap-2 font-bold ">
                <i class='bx bx-shopping-bag md:text-4xl'></i>
                <a href="#" class="order_manament">Order Management</a>
            </div>
            <div class="border-t border-black w-full"></div>
        </div>
        <div class="transition duration-200 ease-in-out hover:bg-blue-200">
            <!-- Cart Management -->
            <div class="flex items-center gap-2 font-bold ">
                <i class='bx bx-cart md:text-4xl'></i>
                <a href="#" class="cart_managent">Cart Management</a>
            </div>
            <div class="border-t border-black w-full"></div>
        </div>
        <div>
            <div class="Revenue_managerment transition duration-200 ease-in-out hover:bg-blue-200">
                <div class="flex items-center gap-2 font-bold ">
                    <i class='bx bx-bar-chart-alt-2 md:text-4xl'></i>
                    <a href="#" class="revenue_managent">Revenue Management</a>
                </div>
                <div class="border-t border-black w-full"></div>
            </div>
            <!-- Revenue Management -->
            <div class="sub_Revenue_managerment hidden md:ml-6  transition duration-200 ease-in-out hover:bg-blue-200">
                <div class="flex md:items-center gap-1">
                    <i class='bx bx-calendar text-3xl'></i>
                    <a href="#" class="Account_title "> Revenue by Month </a>
                </div>
                <div class="border-t border-black w-full"></div>
            </div>
        </div>
    </div>


    <!-- Thêm đoạn mã JavaScript -->
    <script src="assets/js/LeftSlideBar.js">

    </script>
</body>

</html>