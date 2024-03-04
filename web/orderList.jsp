<%-- 
    Document   : orderList
    Created on : Mar 4, 2024, 8:27:44 PM
    Author     : Doan Thanh Phuc - CE170580
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order management</title>
        <script type="text/javascript">
            function doDelete(Order_ID) {
                if (confirm("Are you sure delete Order ID = " + Order_ID + "?")) {
                    window.location = "deleteOrder?OrderID=" + Order_ID;
                }

            }
        </script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/icon.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="assets/js/validation/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="assets/js/script.js"></script>
        <style>
            img {
                width: 200px;
                height: 120px;
            }
        </style>
        <style>
            body {
                margin: 0;
                padding: 0;
            }
        </style>
        <style>
            body {
                background-color: #fbfbfb;
            }

            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0;
                /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }

            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto;
                /* Scrollable contents if viewport is shorter than content. */
            }

            .container {
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }
        </style>
    </head>

    <body>
        <header>
            <jsp:include page="left_sidebar.jsp"></jsp:include>
            </header>
            <main>
                <div class="container mt-3 pt-4">
                    <div class="row" style="margin-bottom: 15px">
                        <div class="col-sm-3 d-flex align-items-center">
                            <h5 class="mb-0 text-left">
                                <strong>ORDER MANAGEMENT</strong>
                            </h5>
                        </div>
                        <div class="col-sm-9 text-right">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                    class="material-icons">&#xE147;</i></a>
                        </div>
                        <table class="table table-bordered table-striped mt-3">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Order Date</th>
                                    <th>Payment status</th>
                                    <th>Order status</th>
                                    <th>Customer ID</th>
                                    <th>Payment Method</th>
                                    <th>Total Amount</th>
                                    <th>Staff take care for</th>                                   
                                    <th>Action</th>
                                </tr>
                            </thead>
                        <c:forEach items="${requestScope.Orders}" var="c">
                            <tr>
                                <td>${c.orderId}</td>
                                <td>${c.orderDate}</td>
                                <td>${c.paymentStatus}</td>
                                <td>${c.orderStatus}</td>
                                <td>${c.customerId}</td>
                                <td>${c.methodId}</td>
                                <td>${c.totalAmount}</td>
                                <td>${c.staffID}</td>

                                <td>
                                    <div class="btn-group">
                                        <c:if test="${StaffID_Check ne c.staffID && c.staffID ne param.StaffID && c.staffID == null}">
                                            <button class="btn btn-success" onclick="location.href = 'updatetakecarestaff?OrderID=${c.orderId}&StaffID=${param.StaffID}'">
                                                <i class='bx bx-check'></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${StaffID_Check eq c.staffID || c.staffID eq param.StaffID}">
                                            <button class="btn btn-warning"
                                                    onclick="location.href = 'updateOrder?OrderID=${c.orderId}'">
                                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                            </button>
                                        </c:if>

                                        &nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-danger" onclick="doDelete('${c.orderId}')">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Delete">&#xE872;</i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
        </main>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var closeModalButton = document.querySelector("button.close");
                var cancelButton = document.querySelector(".modal-footer button[data-dismiss='modal']");

                closeModalButton.addEventListener("click", function () {
                    // Đóng modal khi nút "X" được nhấn
                    $("#addEmployeeModal").modal("hide");
                });
                cancelButton.addEventListener("click", function () {
                    // Đóng modal khi nút "Cancel" được nhấn
                    $("#addEmployeeModal").modal("hide");
                });
            });
            document.addEventListener("DOMContentLoaded", function () {
                var togglePassword = document.getElementById("togglePassword");
                var passwordInput = document.getElementById("password");

                togglePassword.addEventListener("click", function () {
                    var type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
                    passwordInput.setAttribute("type", type);
                    this.querySelector("i").classList.toggle("fa-eye-slash");
                    this.querySelector("i").classList.toggle("fa-eye");
                });
            });
        </script>
        <script src="assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="assets/js/validation/bootstrap.min.js"></script>
        <c:if test="${sessionScope.error != null}">
            <script>
            message("error", "${sessionScope.error}")
            </script>
            <% session.removeAttribute("error");%>
        </c:if>
        <c:if test="${sessionScope.success != null}">
            <script>
                message("success", "${sessionScope.success}")
            </script>
            <% session.removeAttribute("success");%>
        </c:if>
    </body>

</html>
