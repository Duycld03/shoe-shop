<%-- Document : updatestaff Created on : Feb 27, 2024, 7:21:42 PM Author : To Do Hong Y - CE171148 --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <script src="/assets/js/validation/jquery.min.js"></script>
        <script src="/assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="/assets/js/validation/bootstrap.min.js"></script>
    </head>

    <body>
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:set var="c" value="${requestScope.category}" />
                    <form action="loadStaff" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Update Staff</h4>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group d-none">
                                <label for="id">ID:</label>
                                <input type="text" name="id" readonly value="${c.staffId}"
                                       class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>UserName</label>
                                <input name="username" type="text" value="${c.username}"class="form-control" required pattern="[a-zA-Z0-9]+" title="Username must contain only letters and numbers">
                            </div>
                            <div class="form-group">
                                <label>FullName</label>
                                <input name="Fullname" type="text" value="${c.fullname}" class="form-control"
                                       required pattern="[a-zA-Z ]+" title="Full Name cannot contain numbers">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <div class="input-group">
                                    <input name="password" id="password" type="password" class="form-control" pattern=".{5,}" title="Password must be at least 5 characters">
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
                                <input name="email" type="email" class="form-control" value="${c.email}"
                                       required pattern="[a-zA-Z0-9._%+-]+@gmail\.com$"
                                       title="Email must be in the format example@gmail.com">
                            </div>
                            <div class="form-group">
                                <label>Phone Number</label>
                                <input name="phonenumber" type="tel" class="form-control"
                                       value="${c.phoneNumber}" required pattern="[0-9]{10}"
                                       title="Phone number must contain 10 digits">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <input type="submit" name="btnSave" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var editEmployeeModal = document.getElementById("editEmployeeModal");
                var closeModalButtons = document.querySelectorAll("#editEmployeeModal button.close, #editEmployeeModal button[data-dismiss='modal']");

                closeModalButtons.forEach(function (button) {
                    button.addEventListener("click", function () {
                        // Đóng modal khi nút "X" hoặc "Cancel" được nhấn
                        $("#editEmployeeModal").modal("hide");
                        // Chuyển hướng về trang staffmanager
                        window.location.href = "staffmanager";
                    });
                });

            });
            $(document).ready(function () {
                $('#editEmployeeModal').modal('show');
            });
        </script>
    </body>

</html>