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
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/icon.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="assets/js/validation/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="assets/js/script.js"></script>
        <link rel="stylesheet" href="assets/css/manager.css"/>
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
                        <table class="table table-bordered table-striped mt-3">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Order Date</th>
                                    <th>Payment status</th>
                                    <th>Order status</th>
                                    <th>Customer ID</th>
                                    <th>Payment Method</th>
                                    <th>Staff take care for</th>   
                                    <c:if test="${staff != null}">
                                    <th>Action</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <c:forEach items="${requestScope.Orders}" var="c">
                            <tr>
                                <td>${c.orderId}</td>
                                <td>${c.orderDate}</td>
                                <td>${c.paymentStatus}</td>
                                <td>${c.orderStatus}</td>
                                <td>${c.customerId}</td>
                                <td>${c.paymentMethod}</td>
                                <td>${c.staffID}</td>
                                <c:if test="${staff != null}">
                                    <td>
                                        <div class="btn-group d-flex justify-content-center align-items-center">
                                            <c:if test="${c.staffID == null}">
                                                <button class="btn btn-warning text-white" 
                                                        onclick="messageConfirm('Accept this order', () => {
                                                                    location.href = 'ordermanagement?OrderID=${c.orderId}&StaffID=${param.StaffID}'
                                                                })">
                                                    Accept
                                                </button>
                                            </c:if>
                                            <c:if test="${c.staffID != null && c.orderStatus ne 'Processing' && c.orderStatus ne 'Success' && c.orderStatus ne 'Cancel'}">
                                                <button class="btn btn-success"
                                                        onclick="messageConfirm('Order completed', () => {
                                                                    location.href = '/ordermanagement?OrderID=${c.orderId}&status=Success'
                                                                })">
                                                    <i class='bx bx-check'></i>
                                                </button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button class="btn btn-danger" 
                                                        onclick="messageConfirm('Order cancel', () => {
                                                                    location.href = '/ordermanagement?OrderID=${c.orderId}&status=Cancel'
                                                                })">
                                                    <i class='bx bx-x-circle'></i>
                                                </button>
                                            </c:if>

                                        </div>
                                    </td>
                                </c:if>

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
