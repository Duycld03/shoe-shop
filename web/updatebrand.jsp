<%-- 
    Document   : updatebrand
    Created on : Mar 5, 2024, 2:53:12 PM
    Author     : To Do Hong Y - CE171148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <link rel="stylesheet" href="assets/css/bootstrap.min.css">
                <script src="assets/js/validation/jquery.min.js"></script>
                <script src="assets/js/validation//manager.js" type="text/javascript"></script>
                <script src="assets/js/validation/bootstrap.min.js"></script>
            </head>
            <body>
                <div id="editEmployeeModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <c:set var="c" value="${requestScope.category}" />
                            <form action="loadBrand" method="post">
                                <div class="modal-header">
                                    <h4 class="modal-title">Update Staff</h4>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group d-none" >
                                        <label for="id">ID:</label>
                                        <input type="text" name="id" readonly value="${c.brandId}"
                                            class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Brand Name</label>
                                        <input name="brandname" type="text" class="form-control" value="${c.brandName}" required
                                            pattern="[a-zA-Z]+" title="Brand name must contain only letters">
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
                                window.location.href = "brandmanager";
                            });
                        });

                    });
                    $(document).ready(function () {
                        $('#editEmployeeModal').modal('show');
                    });
                </script>
            </body>
</html>
