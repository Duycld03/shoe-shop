<%-- Document : customermanager Created on : Mar 4, 2024, 7:18:01 AM Author : To Do Hong Y - CE171148 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="/assets/css/icon.css">
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <script src="/assets/js/validation/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="/assets/js/script.js"></script>
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

            @media (min-width: 576px) {
                .container {
                    max-width: 540px;
                }
            }

            @media (min-width: 768px) {
                .container {
                    max-width: 972px;
                }
            }

            @media (min-width: 992px) {
                .container {
                    max-width: 960px;
                }
            }

            @media (min-width: 1200px) {
                .container {
                    max-width: 1140px;
                }
            }

            #table-container {
                width: 100%;
                /* Thiết lập chiều rộng của phần tử cha */
            }

            .table {
                width: 100%;
                table-layout: fixed;
                /* Đảm bảo rằng các cột có chiều rộng cố định */
            }

            .table th,
            .table td {
                max-width: 200px;
                /* Thiết lập độ rộng tối đa cho các cột */
                white-space: nowrap;
                /* Ngăn chặn văn bản tràn ra ngoài ô */
                overflow: hidden;
                /* Ẩn nội dung tràn ra ngoài ô */
                text-overflow: ellipsis;
                /* Hiển thị dấu chấm ba (...) khi có nội dung tràn ra ngoài */
            }

            .table th:first-child,
            .table td:first-child {
                width: 80px;
                /* Đặt kích thước cố định cho cột ID */
            }

            /* Thiết lập kích thước cho cột FullName */
            .table th:nth-child(3),
            .table td:nth-child(3) {
                width: auto;
                /* Thiết lập kích thước linh hoạt cho cột FullName */
            }
        </style>
    </head>

    <body>
        <header>
            <jsp:include page="/Manager/left_sidebar.jsp"></jsp:include>
            </header>
            <main>
                <div class="container mt-3 pt-4">
                    <div class="row" style="margin-bottom: 15px">
                        <div class="col-sm-3 d-flex align-items-center">
                            <h5 class="mb-0 text-left">
                                <strong>CUSTOMER MANAGEMENT</strong>
                            </h5>
                        </div>
                        <div class="col-sm-9 text-right">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                    class="material-icons">&#xE147;</i></a>
                        </div>
                    </div>
                <c:if test="${mess!=null }">
                    <div class="alert alert-success" role="alert">
                        ${mess}
                    </div>
                </c:if>
                <div id="table-container">
                    <table class="table table-bordered table-striped mt-3">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>User Name</th>
                                <th>FullName</th>
                                <th>Password</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <c:forEach items="${requestScope.data}" var="c">
                            <c:set var="order_id" value="${c.customerId}" />
                            <tr>
                                <td>${order_id}</td>
                                <td>${c.username}</td>
                                <td>${c.fullname}</td>
                                <td>${c.password}</td>
                                <td>${c.email}</td>
                                <td>${c.phoneNumber}</td>
                                <td>
                                    <div class="btn-group">
                                        <button class="btn btn-info"
                                                onclick="location.href = 'loadCustomer?id=${c.customerId}'">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Edit Customer">&#xE254;</i>
                                        </button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-warning" onclick="messageConfirm('Delete Customer!', () => {
                                                           window.location.href = 'deleteCustomer?customerId=${c.customerId}'
                                                       })">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Delete">&#xE872;</i>
                                        </button>

                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>


            </div>
        </main>

        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addcustomercontroller" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Customer</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>UserName</label>
                                <input name="username" type="text" class="form-control" required pattern="[a-zA-Z0-9]+" title="Username must contain only letters and numbers">
                            </div>
                            <div class="form-group">
                                <label>FullName</label>
                                <input name="Fullname" type="text" class="form-control" required
                                       pattern="[a-zA-Z ]+"
                                       title="Full Name cannot contain numbers or special characters">
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <div class="input-group">
                                    <input name="password" id="password" type="password" class="form-control"
                                           required pattern=".{5,}" title="Password must be at least 5 characters">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button"
                                                id="togglePassword">
                                            <i class="fa fa-eye-slash" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" class="form-control" required
                                       pattern="[a-zA-Z0-9._%+-]+@gmail\.com$"
                                       title="Email must be in the format example@gmail.com">
                            </div>
                            <div class="form-group">
                                <label>Phone Number</label>
                                <input name="phonenumber" type="tel" class="form-control" required
                                       pattern="[0-9]{10}" title="Phone number must contain 10 digits">
                            </div>
                        </div>


                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" name="btnAdd" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
        <script src="/assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="/assets/js/validation/bootstrap.min.js"></script>
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