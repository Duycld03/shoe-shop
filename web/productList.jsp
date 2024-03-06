<%-- 
    Document   : productList
    Created on : Mar 5, 2024, 7:40:18 PM
    Author     : Doan Thanh Phuc - CE170580
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product management</title>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="assets/css/icon.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="assets/js/validation/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="assets/js/script.js"></script>
        <link rel="stylesheet" href="assets/css/manager.css"/>
    </head>
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
                            <strong>PRODUCT MANAGEMENT</strong>
                        </h5>
                    </div>
                    <div class="col-sm-9 text-right">
                        <a href="/addproductmanagement" class="btn btn-success"><i
                                class="material-icons">&#xE147;</i></a>
                    </div>
                    <div>${Error}</div>
                <table class="table table-bordered table-striped mt-3">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Description</th>
                            <th>Brand ID </th>
                            <th>is delete</th>      
                            <th>Action</th>
                        </tr>
                    </thead>
                    <c:forEach var="c" items="${requestScope.ProList}">
                        <c:set var="order_id" value="${c.productId}" />
                        <tr>
                            <td>${c.getProductId()}</td>
                            <td><a href="/productDetailInfor?proID=${c.productId}">${c.productName}</a></td>
                            <td>${c.price}</td>
                            <td>${c.discount}</td>
                            <td>${c.description}</td>
                            <td>${c.brandId}</td>                
                            <td>${c.getIsDelete()}</td>
                            <td>
                                <div class="btn-group d-flex justify-content-center align-items-center">
                                    <button class="btn btn-warning"
                                            onclick="location.href = 'updateproduct?ProID=${c.productId}'">
                                        <i class="material-icons" data-toggle="tooltip"
                                           title="Edit">&#xE254;</i>
                                    </button>
                                    <c:if test="${c.getIsDelete() eq false}">
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="btn btn-danger" onclick="messageConfirm('Delete this product', () => {
                                                    location.href = 'delectproduct?ProID=${c.productId}'
                                                })">
                                            <i class="material-icons" data-toggle="tooltip"
                                               title="Delete">&#xE872;</i>
                                        </button>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
    </main>
    <script src="assets/js/validation//manager.js" type="text/javascript"></script>
    <script src="assets/js/validation/bootstrap.min.js"></script>
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
