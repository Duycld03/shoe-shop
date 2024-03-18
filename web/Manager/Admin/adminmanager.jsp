<%-- Document : adminmanager Created on : Feb 29, 2024, 10:38:09 AM Author : To Do Hong Y - CE171148 --%>

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
        <link rel="stylesheet" href="/assets/css/manager.css" />
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
                                <strong>ADMIN MANAGEMENT</strong>
                            </h5>
                        </div>
                        <div class="col-sm-9 text-right">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                    class="material-icons">&#xE147;</i></a>
                        </div>
                    </div>
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
                        <c:set var="order_id" value="${c.adminId}" />
                        <tr>
                            <td>${order_id}</td>
                            <td>${c.username}</td>
                            <td>${c.fullname}</td>
                            <td>${c.password}</td>
                            <td>${c.email}</td>
                            <td>${c.phoneNumber}</td>
                            <td>
                                <div class="btn-group d-flex justify-content-center align-items-center">
                                    <c:if test="${admin.adminId == c.adminId}">
                                        <button class="btn btn-info text-center"
                                                onclick="location.href = 'loadAdmin?id=${c.adminId}'">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Edit">&#xE254;</i>
                                        </button>
                                        &nbsp;&nbsp;&nbsp;
                                    </c:if>
                                    <button class="btn btn-warning" onclick="messageConfirm('Delete Admin!', () => {
                                                window.location.href = 'deleteAdmin?adminId=${c.adminId}'
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
        </main>

        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addadmincontroller" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Admin</h4>
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