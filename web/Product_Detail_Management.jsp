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
                                <strong>PRODUCT DETAIL MANAGEMENT</strong>
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
                                <a href="/addVariant?ProID=${ProID}" class="btn btn-success" data-toggle="modal">
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
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${requestScope.Variants}" var="var">
                                <tr>
                                    <td>${var.variantId}</td>
                                    <td>${var.color}</td>
                                    <td>${var.size}</td>
                                    <td>${var.stockQuantity}</td>
                                    <td>
                                        <div class="btn-group" onclick="location.href = '/updateVariant?VarID=${var.variantId}'">
                                            <button class="btn btn-warning">
                                                <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                            </button>
                                            &nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-danger" onclick="messageConfirm('This variant', () => {
                                                        location.href = '/delectVariant?VarID=${var.variantId}'
                                                    })">
                                                <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                            </button>
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
                            <a href="/addImg?ProID=${ProID}" class="btn btn-success" data-toggle="modal">
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
                                            <div class="btn-group" onclick="location.href = '/updateImage?ImgID=${img.getImageId()}'">
                                                <button class="btn btn-warning">
                                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                </button>
                                                &nbsp;&nbsp;&nbsp;
                                                <button class="btn btn-danger" onclick="messageConfirm('This image', () => {
                                                            location.href = '/delectImage?ImgId=${img.getImageId()}'
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

        <!-- Add your footer content here -->

    </body>

</html>