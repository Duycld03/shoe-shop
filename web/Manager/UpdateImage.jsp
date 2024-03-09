<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
            <script src="/assets/js/validation/jquery.min.js"></script>
            <script src="/assets/js/validation//manager.js" type="text/javascript"></script>
            <script src="/assets/js/validation/bootstrap.min.js"></script>
            <script src="/assets/js/script.js"></script>
        </head>

        <body>
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <c:set var="c" value="${requestScope.img}" />
                        <form action="/updateimage" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h4 class="modal-title">Add new Product Variant</h4>
                                <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group d-none">
                                    <label>ProID</label>
                                    <input name="proid" type="text" class="form-control" value="${c.productId}">
                                </div>
                                <div class="form-group d-none">
                                    <label>img</label>
                                    <input name="imgid" type="text" class="form-control" value="${c.imageId}">
                                </div>
                                <div class="form-group">
                                    <label>Product URL</label>
                                    <img src="/assets/img/products/${c.imageURL}" width="100px" height="100px"
                                        alt="alt" />
                                    <input name="imgurl" type="file" class="form-control" value="${c.imageURL}">
                                    <div class="text-danger">${sessionScope.error}</div>
                                    <c:if test="${sessionScope.error != null}">
                                        <% session.removeAttribute("error");%>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label>Is Primary</label>
                                    <select name="isprimary" class="form-control">
                                        <option value="true" ${c.isPrimary()=='true' ? 'selected' : '' }>true</option>
                                        <option value="false" ${c.isPrimary()=='false' ? 'selected' : '' }>false
                                        </option>
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
                            window.location.href = "/productDetailInfor?proID=${c.productId}";
                        });
                    });
                });
                $(document).ready(function () {
                    $('#editEmployeeModal').on('hidden.bs.modal', function () {
                        // Chuyển hướng đến trang mong muốn sau khi modal được đóng
                        window.location.href = "/productDetailInfor?ProID=${param.ProID}";
                    });

                    // Hiển thị modal
                    $('#editEmployeeModal').modal('show');
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