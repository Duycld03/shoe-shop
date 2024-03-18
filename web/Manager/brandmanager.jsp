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
        <<link rel="stylesheet" href="../assets/css/manager.css"/>
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
                                <strong>BRAND MANAGEMENT</strong>
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
                                    <button class="btn btn-info"
                                            onclick="location.href = 'loadBrand?id=${c.brandId}'">
                                        <i class="material-icons" data-toggle="tooltip"
                                           title="Edit">&#xE254;</i>
                                    </button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button class="btn btn-warning" onclick="messageConfirm('Delete Brand!', () => {
                                                window.location.href = 'deleteBrand?brandId=${c.brandId}'
                                            })">
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

                closeModalButton.addEventListener("click", closeModal);
                cancelButton.addEventListener("click", closeModal);

                function closeModal() {
// Đóng modal khi nút "X" hoặc "Cancel" được nhấn
                    $("#addEmployeeModal").modal("hide");
                }
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