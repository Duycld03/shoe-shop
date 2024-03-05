
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
        <header>
            <jsp:include page="left_sidebar.jsp"></jsp:include>
            </header>
            <main>
                <div class="container mt-3 pt-4">
                    <div class="row" style="margin-bottom: 15px">
                        <div class="col-sm-3 d-flex align-items-center">
                            <h5 class="mb-0 text-left">
                                <strong>PRODUCT DETAIL MANAGEMENT</strong>
                            </h5>
                        </div>
                        <div class="col-sm-3 d-flex align-items-center">
                            <h5 class="mb-0 text-center">
                                <strong>Product Variants</strong>
                            </h5>
                        </div>
                        <table class="table table-bordered table-striped mt-3">
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
                                    <div class="btn-group d-flex justify-content-center align-items-center">
                                        <button class="btn btn-warning"
                                                onclick="location.href = 'updateVariant?VarID=${var.variantId}'">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Edit">&#xE254;</i>
                                        </button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-danger" onclick="${var.variantId}">
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


    </body>

</html>