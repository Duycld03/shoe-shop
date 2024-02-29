document.addEventListener("DOMContentLoaded", function () {
    // Lấy các phần tử cần thao tác
    var accountManagementSub = document.querySelector(".AccountManament-sub");
    var subAccountMAdmin = document.querySelector(".sub_AccountM_Admin");
    var subAccountMStaff = document.querySelector(".sub_AccountM_Staff");
    var subAccountMCustomer = document.querySelector(".sub_AccountM_Customer");

    // Lắng nghe sự kiện click
    accountManagementSub.addEventListener("click", function () {
        // Kiểm tra trạng thái hiển thị của sub_AccountM_Admin
        var isAdminVisible = subAccountMAdmin.classList.contains("hidden");

        // Ẩn tất cả các phần tử
        subAccountMAdmin.classList.add("hidden");
        subAccountMStaff.classList.add("hidden");
        subAccountMCustomer.classList.add("hidden");

        // Nếu sub_AccountM_Admin đang ẩn, thì hiển thị nó
        if (isAdminVisible) {
            subAccountMAdmin.classList.remove("hidden");
            subAccountMStaff.classList.remove("hidden");
            subAccountMCustomer.classList.remove("hidden");

        }
    });
});
document.addEventListener("DOMContentLoaded", function () {
    // Lấy các phần tử cần thao tác
    var accountManagementSub = document.querySelector(".Revenue_managerment");
    var subAccountMAdmin = document.querySelector(".sub_Revenue_managerment");


    // Lắng nghe sự kiện click
    accountManagementSub.addEventListener("click", function () {
        // Kiểm tra trạng thái hiển thị của sub_AccountM_Admin
        var isAdminVisible = subAccountMAdmin.classList.contains("hidden");

        // Ẩn tất cả các phần tử
        subAccountMAdmin.classList.add("hidden");


        // Nếu sub_AccountM_Admin đang ẩn, thì hiển thị nó
        if (isAdminVisible) {
            subAccountMAdmin.classList.remove("hidden");
        }
    });
});