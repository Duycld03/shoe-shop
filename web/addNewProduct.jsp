<%-- 
    Document   : addNewProduct
    Created on : Mar 6, 2024, 1:33:06 PM
    Author     : Doan Thanh Phuc - CE170580
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="assets/js/script.js"></script>
    </head>
    <body>
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:set var="c" value="${requestScope.Pro}" />
                    <form action="/addproductmanagement" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add new Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="productName" type="text" class="form-control" value="${c.productName}" required>
                                <div class="text-warning">${NameError}</div>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" min="1" type="number" class="form-control" value="${c.price}" required
                                       title="Price must contain 10 digits">
                            </div>
                            <div class="form-group">
                                <label>Discount</label>
                                <input name="discount" min="0"  type="number" class="form-control" value="${c.discount}" required
                                       title="Discount number must contain 10 digits">
                            </div>

                            <div class="form-group">
                                <label>Description</label>
                                <input name="description" type="text" value="${c.description}" class="form-control" required
                                       title="Description Name cannot contain numbers">
                            </div>
                            <div class="form-group">
                                <label>Brand</label>
                                <select name="brandID" class="form-control">
                                    <c:forEach var="brand" items="${requestScope.Brands}">
                                        <option value="${brand.brandId}"${(c.brandId eq brand.brandId) ? 'selected' : ''}>${brand.brandId}</option>
                                    </c:forEach>
                                </select>
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
                        window.location.href = "productmanagement";
                    });
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
            $(document).ready(function () {
                $('#editEmployeeModal').modal('show');
            });
        </script>
    </body>
</html>
