<%-- 
    Document   : updatestaff
    Created on : Feb 27, 2024, 7:21:42 PM
    Author     : To Do Hong Y - CE171148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/js/validation/bootstrap.min.css">
        <script src="assets/js/validation/jquery.min.js"></script>
        <script src="assets/js/validation//manager.js" type="text/javascript"></script>
        <script src="assets/js/validation/bootstrap.min.js"></script>
    </head>
    <body>
  <div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <c:set var="c" value="${requestScope.category}"/>
            <form action="loadStaff" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Update Staff</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="id">Enter ID:</label>
                        <input type="text" name="id" readonly value="${c.staffId}" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>UserName</label>
                        <input name="username" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>FullName</label>
                        <input name="Fullname" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input name="password" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input name="phonenumber" type="text" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <input type="submit" class="btn btn-success" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    var editEmployeeModal = document.getElementById("editEmployeeModal");
    var closeModalButtons = document.querySelectorAll("#editEmployeeModal button.close, #editEmployeeModal button[data-dismiss='modal']");

    closeModalButtons.forEach(function(button) {
        button.addEventListener("click", function () {
            // Đóng modal khi nút "X" hoặc "Cancel" được nhấn
            $("#editEmployeeModal").modal("hide");
            // Chuyển hướng về trang staffmanager
            window.location.href = "staffmanager";
        });
    });
});

</script>
<script>
    $(document).ready(function() {
        $('#editEmployeeModal').modal('show');
    });
</script>
    </body>
</html>
