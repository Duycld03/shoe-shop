<%-- Document : brandmanager.jsp Created on : Mar 5, 2024, 2:21:02 PM Author : To Do Hong Y - CE171148 --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <script type="text/javascript">
                    function doDelete(brand_id) {
                        if (confirm("Are you sure delete brandId = " + brand_id + "?")) {
                            window.location = "deleteBrand?brandId=" + brand_id;
                        }
                    }

                </script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <link rel="stylesheet" href="/assets/css/icon.css">
                <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
                <script src="/assets/js/validation/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script src="/assets/js/script.js"></script>
                <style>
                    img {
                        width: 200px;
                        height: 120px;
                    }
                </style>
                <style>
                    body {
                        margin: 0;
                        padding: 0;
                    }
                </style>
                <style>
                    body {
                        background-color: #fbfbfb;
                    }

                    @media (min-width: 991.98px) {
                        main {
                            padding-left: 240px;
                        }
                    }

                    /* Sidebar */
                    .sidebar {
                        position: fixed;
                        top: 0;
                        bottom: 0;
                        left: 0;
                        padding: 58px 0 0;
                        /* Height of navbar */
                        box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                        width: 240px;
                        z-index: 600;
                    }

                    @media (max-width: 991.98px) {
                        .sidebar {
                            width: 100%;
                        }
                    }

                    .sidebar .active {
                        border-radius: 5px;
                        box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
                    }

                    .sidebar-sticky {
                        position: relative;
                        top: 0;
                        height: calc(100vh - 48px);
                        padding-top: 0.5rem;
                        overflow-x: hidden;
                        overflow-y: auto;
                        /* Scrollable contents if viewport is shorter than content. */
                    }

                    .container {
                        padding-right: 15px;
                        padding-left: 15px;
                        margin-right: auto;
                        margin-left: auto;
                    }

                    @media (min-width: 576px) {
                        .container {
                            max-width: 540px;
                        }
                    }

                    @media (min-width: 768px) {
                        .container {
                            max-width: 972px;
                        }
                    }

                    @media (min-width: 992px) {
                        .container {
                            max-width: 960px;
                        }
                    }

                    @media (min-width: 1200px) {
                        .container {
                            max-width: 1140px;
                        }
                    }
                </style>
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
                                    <strong>BRAND MANAGER</strong>
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
                                    <th>Brand Name</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <c:forEach items="${requestScope.data}" var="c">
                                <c:set var="order_id" value="${c.brandId}" />
                                <tr>
                                    <td>${order_id}</td>
                                    <td>${c.brandName}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button class="btn btn-warning"
                                                onclick="location.href = 'loadBrand?id=${c.brandId}'">
                                                <i class="material-icons" data-toggle="tooltip"
                                                    title="Edit">&#xE254;</i>
                                            </button>
                                            &nbsp;&nbsp;&nbsp;
                                            <button class="btn btn-danger" onclick="doDelete('${c.brandId}')">
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
                            <form action="addbrandcontroller" method="post">
                                <div class="modal-header">
                                    <h4 class="modal-title">Add Brand</h4>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Brand Name</label>
                                        <input name="brandname" type="text" class="form-control" required
                                            pattern="[a-zA-Z]+" title="Brand name must contain only letters">
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