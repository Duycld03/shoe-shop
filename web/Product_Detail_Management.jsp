<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h5 class="mb-0 text-left text-lg">
                                <strong>DETAIL MANAGEMENT</strong>
                            </h5>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-sm-6">
                            <h5 class="mb-0 text-left text-lg">
                                <strong>This is detail information of ${pro.productName}</strong>
                        </h5>
                    </div>
                </div>
                <!-- Product Variants Table -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <h5 class="mb-0 text-center">
                            <strong>Product Variants</strong>
                        </h5>
                        <div class="text-left mb-3">
                            <a href="/addVariant.jsp?ProID=${pro.productId}" class="btn btn-success" data-toggle="modal">
                                <span class=" mr-2 text-white">Add variant</span>
                            </a>
                        </div>
                        <table class="table table-bordered table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Color</th>
                                    <th>Size</th>
                                    <th>Stock Quantity</th>
                                    <th>Is Delete</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${requestScope.Variants}" var="var">
                                <tr>
                                    <td>${var.variantId}</td>
                                    <td>${var.color}</td>
                                    <td>${var.size}</td>
                                    <td>${var.stockQuantity}</td>            
                                    <td>${var.isDelete()}</td>
                                    <td>
                                        <div class="btn-group d-flex align-items-center">
                                            <button class="btn btn-warning" onclick="location.href = '/updatevariant?VarID=${var.variantId}'">
                                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                            </button>
                                            &nbsp;&nbsp;&nbsp;
                                            <c:if test="${var.isDelete() eq false}">
                                                <button class="btn btn-danger" onclick="messageConfirm('Delete this variant', () => {
                                                            location.href = '/deletevariant?VarID=${var.variantId}&&proid=${pro.productId}';
                                                        })">
                                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                </button>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                    <!-- Product Image Table -->
                    <div class="col-sm-12">
                        <h5 class="mb-0 text-center">
                            <strong>Product Image</strong>
                        </h5>
                        <div class="text-right mb-3 d-flex align-items-center">
                            <a href="/addimage?ProID=${pro.productId}" class="btn btn-success" data-toggle="modal">
                                <span class="mr-2 text-white">Add Image</span>
                            </a>
                        </div>
                        <table class="table table-bordered table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Image URL</th>
                                    <th>Is Primary</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${requestScope.Images}" var="img">
                                <tr>
                                    <td>${img.getImageId()}</td>
                                    <td><img src="assets/img/products/${img.getImageURL()}" alt="alt"/></td>
                                    <td>${img.isPrimary()}</td>
                                    <td>
                                        <div class="btn-group">
                                            <div class="btn-group">
                                                <button class="btn btn-warning" onclick="location.href = '/updateimage?ImgID=${img.getImageId()}&&proid=${pro.productId}'">
                                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                </button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button class="btn btn-danger" onclick="messageConfirm('Delete this image', () => {
                                                            location.href = '/deleteimage?imgid=${img.getImageId()}&&proid=${pro.productId}';
                                                        })">
                                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </main>
<!--        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <c:set var="c" value="${requestScope.img}" />
                    <form action="/updateimage" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <h4 class="modal-title">Add new Product Variant</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group d-none">
                                <label>ProID</label>
                                <input name="proid" type="text" class="form-control" value="${param.ProID}">
                            </div>
                            <div class="form-group d-none">
                                <label>img</label>
                                <input name="proid" type="text" class="form-control" value="${c.imageId}">
                            </div>
                            <div class="form-group">
                                <label>Product URL</label>
                                <img src="assets/img/products/${c.imageURL}" width="100px" height="100px" alt="alt"/>
                                <input name="imgurl" type="file" class="form-control" value="${c.imageURL}">
                                <div class="text-danger">${sessionScope.error}</div>
                                <c:if test="${sessionScope.error != null}">
                                    <% session.removeAttribute("error");%>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label>Is Primary</label>
                                <select name="isprimary" class="form-control">
                                    <option value="true" ${c.isPrimary() == 'true' ? 'selected' : ''}>true</option>
                                    <option value="false" ${c.isPrimary() == 'false' ? 'selected' : ''}>false</option>
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
                        window.location.href = "/productDetailInfor?proID=${param.ProID}";
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
                $('#editEmployeeModal').modal('hide');
            });
            
        </script>-->
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
